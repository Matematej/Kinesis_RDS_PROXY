output "Kinesis_Data_Stream_IAM_Role_ARN" {
  value = aws_iam_role.role.arn
  description = "lambda ingest Kinesis Data Stream IAM Role ARN"
}