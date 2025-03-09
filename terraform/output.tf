output "lambda_arns" {
  description = "ARNs of the Lambda functions"
  value       = { for k, v in module.lambda : k => v.lambda_arn }
}

output "s3_bucket_names" {
  description = "Names of the S3 buckets"
  value       = { for k, v in module.s3 : k => v.bucket_name }
}

output "msk_bootstrap_brokers" {
  description = "MSK cluster bootstrap brokers"
  value       = module.msk.msk_bootstrap_brokers
}

output "glue_job_name" {
  description = "Name of the Glue job"
  value       = module.glue.glue_job_name
}