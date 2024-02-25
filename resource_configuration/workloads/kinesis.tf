resource "aws_kinesis_stream" "kinesis_data_stream" {
  name        = "terraform-kinesis-test"
  shard_count = 1

  shard_level_metrics = [
    "IncomingRecords",
    "OutgoingRecords",
  ]

  stream_mode_details {
    stream_mode = "PROVISIONED"
  }

  tags = {
    Project     = "Real-time Data Processing",
    Environment = "Prod"
  }
}


output "kinesis_data_stream" {
  value       = aws_kinesis_stream.kinesis_data_stream.arn
  description = "Kinesis data stream arn"
}