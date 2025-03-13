#!/bin/bash

# Check if environment argument is provided
if [ -z "$1" ]; then
  echo "Usage: ./deploy.sh <environment>"
  echo "Environment must be one of: dev, stage, prod"
  exit 1
fi

ENVIRONMENT=$1

# Zip Lambda functions and upload to S3
for LAMBDA_DIR in ../../../lambda/*/; do
  [ -d "$LAMBDA_DIR" ] || continue  # Skip if no directories exist
  LAMBDA_NAME=$(basename "$LAMBDA_DIR")
  echo "Zipping Lambda function: $LAMBDA_NAME..."
  (cd "$LAMBDA_DIR" && zip -r "$LAMBDA_NAME.zip" .)
  aws s3 cp "$LAMBDA_DIR$LAMBDA_NAME.zip" "s3://my-bucket-$ENVIRONMENT/lambda/$LAMBDA_NAME.zip"
done

# Zip Glue job scripts and upload to S3
for GLUE_DIR in ../../../glue/*/; do
  [ -d "$GLUE_DIR" ] || continue  # Skip if no directories exist
  GLUE_JOB_NAME=$(basename "$GLUE_DIR")
  echo "Zipping Glue job script: $GLUE_JOB_NAME..."
  (cd "$GLUE_DIR" && zip -r "$GLUE_JOB_NAME.zip" .)
  aws s3 cp "$GLUE_DIR$GLUE_JOB_NAME.zip" "s3://my-bucket-$ENVIRONMENT/glue/$GLUE_JOB_NAME.zip"
done


# Navigate to the Terraform environment directory
if [ ! -d "environments/$ENVIRONMENT" ]; then
  echo "Error: Terraform environment directory 'environments/$ENVIRONMENT' not found!"
  exit 1
fi

cd environments/$ENVIRONMENT


# Initialize Terraform
terraform init

if [ "$CHANGED_FILES" = "all" ]; then
  echo "First commit detected. Applying full Terraform configuration..."
  terraform apply
elif [ -z "$CHANGED_FILES" ]; then
  echo "No specific changes detected. Applying full configuration..."
  terraform apply
else
  # Loop through changed files and deploy specific components
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
fi
