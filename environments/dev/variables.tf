# AWS Region
variable "aws_region" {
  description = "AWS region"
  type        = string
}

# Lambda Functions
variable "lambda_functions" {
  description = "Map of Lambda functions"
  type = map(object({
    handler = string
    runtime = string
    filename = string
  }))
}

# S3 Buckets
variable "s3_buckets" {
  description = "Map of S3 buckets"
  type        = map(string)
}

# MSK Cluster
variable "msk_cluster_name" {
  description = "Name of the MSK cluster"
  type        = string
}

variable "msk_kafka_version" {
  description = "Kafka version"
  type        = string
}

variable "msk_number_of_broker_nodes" {
  description = "Number of broker nodes"
  type        = number
}

variable "msk_broker_instance_type" {
  description = "Instance type for broker nodes"
  type        = string
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
}

variable "msk_encryption_at_rest_kms_key_arn" {
  description = "KMS key ARN for encryption at rest"
  type        = string
}

# Glue Job
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
}

variable "glue_default_arguments" {
  description = "Default arguments for the Glue job"
  type        = map(string)
}

variable "glue_max_retries" {
  description = "Maximum number of retries for the Glue job"
  type        = number
}

variable "glue_timeout" {
  description = "Timeout for the Glue job in minutes"
  type        = number
}