output "Kinesis_data_Stream_ARN" {
  value = aws_kinesis_stream.kinesis_data_stream.arn
  description = "Kinesis Data Stream ARN"
}