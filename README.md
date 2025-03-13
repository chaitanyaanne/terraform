# Terraform AWS Project

This project uses Terraform to deploy AWS resources, including Lambda functions, S3 buckets, MSK clusters, and Glue jobs.

## Project Structure

- **environments/**: Contains environment-specific configurations (dev, stage, prod).
- **modules/**: Contains reusable Terraform modules for Lambda, S3, MSK, and Glue.
- **scripts/**: Contains deployment and testing scripts.
- **tests/**: Contains test scripts for Lambda, S3, MSK, and Glue.
- **lambda/**: Contains Lambda function code.
- **s3/**: Contains S3 bucket configurations.
- **msk/**: Contains MSK cluster configurations.
- **glue/**: Contains Glue job configurations.

## How to Use

1. Deploy resources:
   ```bash
   cd environments/dev
   terraform init
   terraform apply