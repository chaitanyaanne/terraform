import boto3

def test_glue():
    client = boto3.client('glue')
    response = client.list_jobs()
    jobs = response['JobNames']
    assert len(jobs) > 0, "No Glue jobs found!"
    print("Glue test passed!")

if __name__ == "__main__":
    test_glue()