resource "aws_iam_policy" "s3_policy" {
  name        = "s3_access_policy"
  description = "Policy for S3 access"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
