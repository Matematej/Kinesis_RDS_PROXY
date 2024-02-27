terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

module "workloads" {
 source = "./resource_configuration/workloads"
 Kinesis_Data_Stream_IAM_Role_ARN = module.security.Kinesis_Data_Stream_IAM_Role_ARN
}

module "security" {
 source = "./resource_configuration/security"
 Kinesis_data_Stream_ARN = module.workloads.Kinesis_data_Stream_ARN
}