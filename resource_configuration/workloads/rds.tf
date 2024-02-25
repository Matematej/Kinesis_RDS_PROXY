/*
resource "aws_db_instance" "default" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.medium"
  identifier = "mydb"
  username = "dbuser"
  password = "dbpassword"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name

  backup_retention_period = 7
  backup_window = "03:00-04:00"
  maintenance_window = "mon:04:00-mon:04:30"
  skip_final_snapshot = false
  final_snapshot_identifier = "my-db"
  monitoring_interval = 60
  monitoring_role_arn = aws_iam_role.rds_monitoring_role.arn
  performance_insights_enabled = true
  # Enable storage encryption
  storage_encrypted = true
  # Specify the KMS key ID for encryption (replace with your own KMS key ARN)
  kms_key_id = aws_kms_key.my_kms_key.arn

  parameter_group_name = aws_db_parameter_group.my_db_pmg.name
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name = "my-db-subnet-group"
  subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  tags = {
    Name = "My DB Subnet Group"
  }
}

resource "aws_db_parameter_group" "my_db_pmg" {
  name = "my-db-pg"
  family = "mysql5.7"

  parameter {
    name = "connect_timeout"
    value = "15"
  }

}

output "RDS_address" {
  description = "Address of the RDS instance."
  value       = aws_db_instance.database.address
}
*/