output "Kinesis_Data_Stream_IAM_Role_ARN" {
  value = module.security.Kinesis_Data_Stream_IAM_Role_ARN
  description = "lambda ingest Kinesis Data Stream IAM Role ARN"
}