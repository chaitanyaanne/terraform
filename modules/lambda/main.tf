resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = module.iam.lambda_role_arn  # Uses the IAM role from the IAM module

  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)
}

# Attach Additional Permissions if Needed
resource "aws_iam_role_policy_attachment" "lambda_extra_permissions" {
  role       = module.iam.lambda_role_name  # Uses the IAM role from the IAM module
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "lambda_arn" {
  value = aws_lambda_function.lambda.arn
}
