#lambda ingest Kinesis Data Stream
#assume role
resource "aws_iam_role" "role" {
  name = "lambda-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# Policy for Kinesis Data Streams
resource "aws_iam_policy" "policy" {
  name = "my-test-policy"
  description = "A test policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "kinesis:GetRecords",
          "kinesis:GetShardIterator",
          "kinesis:DescribeStream",
          "kinesis:ListStreams"
          ],
            "Resource": "${var.Kinesis_data_Stream_ARN}"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:*"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        }
  ]
}
EOF
}

# Attached IAM Role and the new created Policy
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = "${aws_iam_role.role.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}


/*
resource "aws_iam_role" "rds_monitoring_role" {
  name = "rds-monitoring-role"

  assume_role_policy = jsonencode({
  Version = "2012-10-17",
  Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
        Service = "monitoring.rds.amazonaws.com"
      }
    }
  ]
})
}



resource "aws_iam_policy_attachment" "rds_monitoring_attachment" {
  name = "rds-monitoring-attachment"
  roles = [aws_iam_role.rds_monitoring_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

output "lambda_role_arn" {
  description = "ARN of the IAM role used by Lambda."
  value       = aws_iam_role.lambda.arn
}
*/