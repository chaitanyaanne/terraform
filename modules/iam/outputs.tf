output "lambda_role_arn" {
  description = "IAM Role ARN for Lambda"
  value       = aws_iam_role.lambda_role.arn
}

output "glue_role_arn" {
  description = "IAM Role ARN for Glue"
  value       = aws_iam_role.glue_role.arn
}

output "s3_role_arn" {
  description = "IAM Role ARN for S3"
  value       = aws_iam_role.s3_role.arn
}
