provider "aws" {
  region = var.aws_region
}

module "lambda" {
  for_each = var.lambda_functions
  source   = "../../modules/lambda"

  function_name = each.key
  handler       = each.value.handler
  runtime       = each.value.runtime
  filename      = each.value.filename
}

module "s3" {
  for_each = var.s3_buckets
  source   = "../../modules/s3"

  bucket_name = each.key
}

module "msk" {
  source = "../../modules/msk"

  cluster_name           = var.msk_cluster_name
  kafka_version          = var.msk_kafka_version
  number_of_broker_nodes = var.msk_number_of_broker_nodes
}

module "glue" {
  source = "../../modules/glue"

  job_name        = var.glue_job_name
  role_arn        = var.glue_role_arn
  script_location = var.glue_script_location
}