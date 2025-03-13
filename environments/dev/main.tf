provider "aws" {
  region = var.aws_region
}

module "lambda" {
  for_each = var.lambda_functions
  source   = "../../modules/lambda"

  function_name = each.key
  handler       = each.value.handler
  runtime       = each.value.runtime
  filename      = "s3://my-bucket-dev/lambda/${each.key}.zip"
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
  broker_instance_type   = var.msk_broker_instance_type
  client_subnets         = var.msk_client_subnets
  security_groups        = var.msk_security_groups
  ebs_volume_size        = var.msk_ebs_volume_size
  encryption_at_rest_kms_key_arn = var.msk_encryption_at_rest_kms_key_arn
}

module "glue" {
  source = "../../modules/glue"

  job_name        = var.glue_job_name
  role_arn        = var.glue_role_arn
  script_location = "s3://my-bucket-dev/glue/my-glue-job.zip"
  python_version  = var.glue_python_version
  default_arguments = var.glue_default_arguments
  max_retries     = var.glue_max_retries
  timeout         = var.glue_timeout
}