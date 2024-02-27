#Lambda to ingest Kinesis Data Stream
resource "aws_lambda_function" "ingest_kinesis_data_streams_code" {
  filename      = "ingest_kinesis_data_streams_code.zip"
  function_name = "ingest_kinesis_data_streams_code"
  role          = var.Kinesis_Data_Stream_IAM_Role_ARN
  handler       = "index.handler"
  runtime       = "python3.8" # Change to your preferred runtime

  tags = {
    Project     = "Real-time Data Processing",
    Environment = "Prod"
  }
}

#Lambda to ingest Kinesis Data Stream SourceCode
data "archive_file" "zip_ingest_kinesis_data_stream_code" {
type        = "zip"
source_dir  = "${path.module}/lambda_functions_code/"
output_path = "${path.module}/lambda_functions_code/ingest_kinesis_data_streams_code.zip"
}


resource "aws_lambda_event_source_mapping" "prod_mapping" {
  event_source_arn  = aws_kinesis_stream.kinesis_data_stream.arn
  function_name     = aws_lambda_function.ingest_kinesis_data_streams_code.arn
  starting_position = "LATEST"
}