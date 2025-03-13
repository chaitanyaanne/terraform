# AWS Region
aws_region = "us-east-1"

# Lambda Functions
lambda_functions = {
  example_lambda = {
    handler = "main.lambda_handler"
    runtime = "python3.8"
    filename = "../../lambda/example-lambda/lambda.zip"
  }
  another_lambda = {
    handler = "main.lambda_handler"
    runtime = "python3.8"
    filename = "../../lambda/another-lambda/lambda.zip"
  }
}

# S3 Buckets
s3_buckets = {
  my-bucket       = "my-bucket-dev"
  another-bucket  = "another-bucket-dev"
}

# MSK Cluster
msk_cluster_name           = "my-msk-cluster-dev"
msk_kafka_version          = "2.8.0"
msk_number_of_broker_nodes = 3
msk_broker_instance_type   = "kafka.m5.large"
msk_client_subnets         = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
msk_security_groups        = ["sg-0123456789abcdef0"]
msk_ebs_volume_size        = 100
msk_encryption_at_rest_kms_key_arn = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-abcd-1234-abcd-123456789012"

# Glue Job
glue_job_name        = "my-glue-job-dev"
glue_role_arn        = "arn:aws:iam::123456789012:role/AWSGlueServiceRole"
glue_script_location = "s3://my-bucket-dev/glue/script.py"
glue_python_version  = "3"
glue_default_arguments = {
  "--input_path"  = "s3://my-bucket-dev/input/"
  "--output_path" = "s3://my-bucket-dev/output/"
}
glue_max_retries     = 3
glue_timeout         = 2880