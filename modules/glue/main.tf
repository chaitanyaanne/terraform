resource "aws_glue_job" "glue_job" {
  name     = var.job_name
  role_arn = var.role_arn

  command {
    script_location = var.script_location
    python_version  = var.python_version
  }

  default_arguments = var.default_arguments
  max_retries       = var.max_retries
  timeout           = var.timeout

  tags = var.tags
}

output "glue_job_name" {
  description = "Name of the Glue job"
  value       = aws_glue_job.glue_job.name
}