import boto3

def test_lambda():
    client = boto3.client('lambda')
    response = client.list_functions()
    functions = response['Functions']
    assert len(functions) > 0, "No Lambda functions found!"
    print("Lambda test passed!")

if __name__ == "__main__":
    test_lambda()