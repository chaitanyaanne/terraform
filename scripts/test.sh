#!/bin/bash

# Check if environment argument is provided
if [ -z "$1" ]; then
  echo "Usage: ./test.sh <environment>"
  echo "Environment must be one of: dev, stage, prod"
  exit 1
fi

ENVIRONMENT=$1

# Run Lambda tests
echo "Running Lambda tests for $ENVIRONMENT..."
python3 ../tests/test_lambda.py

# Run S3 tests
echo "Running S3 tests for $ENVIRONMENT..."
python3 ../tests/test_s3.py

# Run MSK tests
echo "Running MSK tests for $ENVIRONMENT..."
python3 ../tests/test_msk.py

# Run Glue tests
echo "Running Glue tests for $ENVIRONMENT..."
python3 ../tests/test_glue.py