resource "aws_iam_policy" "glue_policy" {
  name        = "glue_execution_policy"
  description = "Policy for Glue job execution"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "glue:StartJobRun",
                "glue:GetJobRun",
                "glue:BatchStopJobRun",
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
