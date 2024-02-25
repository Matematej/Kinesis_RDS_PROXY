def lambda_handler(event, context):
    # The 'event' parameter contains information about the triggering event.
    # The 'context' parameter provides runtime information.

    # Your main logic goes here
    message = "Hello, World!"

    # Print the message (this will appear in the CloudWatch logs)
    print(message)

    # Return the message (this is optional and depends on your use case)
    return {
        'statusCode': 200,
        'body': message
    }