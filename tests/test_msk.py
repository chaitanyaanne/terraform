import boto3

def test_msk():
    client = boto3.client('kafka')
    response = client.list_clusters()
    clusters = response['ClusterInfoList']
    assert len(clusters) > 0, "No MSK clusters found!"
    print("MSK test passed!")

if __name__ == "__main__":
    test_msk()