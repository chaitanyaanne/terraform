#!/bin/bash

# Check if environment argument is provided
if [ -z "$1" ]; then
  echo "Usage: ./deploy.sh <environment>"
  echo "Environment must be one of: dev, stage, prod"
  exit 1
fi

ENVIRONMENT=$1

# Navigate to the Terraform environment directory
cd environments/$ENVIRONMENT

# Initialize Terraform
terraform init

# Get the list of changed files
CHANGED_FILES=$(git diff --name-only HEAD HEAD~1)

# Loop through changed files and determine which resources to deploy
for FILE in $CHANGED_FILES; do
  if [[ $FILE == *"lambda/"* ]]; then
    LAMBDA_NAME=$(echo $FILE | awk -F'/' '{print $2}')
    echo "Deploying Lambda function: $LAMBDA_NAME..."
    terraform apply -target=module.lambda[\"$LAMBDA_NAME\"]
  elif [[ $FILE == *"s3/"* ]]; then
    BUCKET_NAME=$(echo $FILE | awk -F'/' '{print $2}')
    echo "Deploying S3 bucket: $BUCKET_NAME..."
    terraform apply -target=module.s3[\"$BUCKET_NAME\"]
  elif [[ $FILE == *"msk/"* ]]; then
    echo "Deploying MSK cluster..."
    terraform apply -target=module.msk
  elif [[ $FILE == *"glue/"* ]]; then
    echo "Deploying Glue job..."
    terraform apply -target=module.glue
  fi
done

# Apply the full configuration if no specific changes are detected
if [ -z "$CHANGED_FILES" ]; then
  echo "No specific changes detected. Applying full configuration..."
  terraform apply
fi