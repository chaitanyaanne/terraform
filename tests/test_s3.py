import boto3

def test_s3():
    client = boto3.client('s3')
    response = client.list_buckets()
    buckets = response['Buckets']
    assert len(buckets) > 0, "No S3 buckets found!"
    print("S3 test passed!")

if __name__ == "__main__":
    test_s3()