variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Lambda Variables
variable "lambda_functions" {
  description = "Map of Lambda functions"
  type = map(object({
    handler = string
    runtime = string
    filename = string
  }))
  default = {
    example_lambda = {
      handler = "main.lambda_handler"
      runtime = "python3.8"
      filename = "lambda/example-lambda/lambda.zip"
    }
    another_lambda = {
      handler = "main.lambda_handler"
      runtime = "python3.8"
      filename = "lambda/another-lambda/lambda.zip"
    }
  }
}

# S3 Variables
variable "s3_buckets" {
  description = "Map of S3 buckets"
  type        = map(string)
  default = {
    my-bucket       = "my-bucket"
    another-bucket  = "another-bucket"
  }
}

# MSK Variables
variable "msk_cluster_name" {
  description = "Name of the MSK cluster"
  type        = string
}

variable "msk_kafka_version" {
  description = "Kafka version"
  type        = string
  default     = "2.8.0"
}

variable "msk_number_of_broker_nodes" {
  description = "Number of broker nodes"
  type        = number
  default     = 3
}

variable "msk_broker_instance_type" {
  description = "Instance type for broker nodes"
  type        = string
  default     = "kafka.m5.large"
}

variable "msk_client_subnets" {
  description = "Subnets for the MSK cluster"
  type        = list(string)
}

variable "msk_security_groups" {
  description = "Security groups for the MSK cluster"
  type        = list(string)
}

variable "msk_ebs_volume_size" {
  description = "EBS volume size for broker nodes"
  type        = number
  default     = 100
}

variable "msk_encryption_at_rest_kms_key_arn" {
  description = "KMS key ARN for encryption at rest"
  type        = string
}

variable "msk_tags" {
  description = "Tags for the MSK cluster"
  type        = map(string)
  default     = {}
}

# Glue Variables
variable "glue_job_name" {
  description = "Name of the Glue job"
  type        = string
}

variable "glue_role_arn" {
  description = "IAM role ARN for the Glue job"
  type        = string
}

variable "glue_script_location" {
  description = "S3 path to the Glue job script"
  type        = string
}

variable "glue_python_version" {
  description = "Python version for the Glue job"
  type        = string
  default     = "3"
}

variable "glue_default_arguments" {
  description = "Default arguments for the Glue job"
  type        = map(string)
  default     = {}
}

variable "glue_max_retries" {
  description = "Maximum number of retries for the Glue job"
  type        = number
  default     = 3
}

variable "glue_timeout" {
  description = "Timeout for the Glue job in minutes"
  type        = number
  default     = 2880
}

variable "glue_tags" {
  description = "Tags for the Glue job"
  type        = map(string)
  default     = {}
}