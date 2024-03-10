import boto3
import base64

def lambda_handler(event, context):
    client = boto3.client('kinesis')
    responses = []

    for record in event['Records']:
        try:
            data_to_decode = record['kinesis']['data']
            padding = '=' * ((4 - len(data_to_decode) % 4) % 4)
            decoded_data = base64.b64decode(data_to_decode + padding)
            responses.append(decoded_data)
            print('Decoded payload:', decoded_data)
        except Exception as e:
            print(f"Error decoding record: {str(e)}")
            decoded_data = None

    return {
        'statusCode': 200,
        'body': '\n'.join(str(response) for response in responses)
    }
