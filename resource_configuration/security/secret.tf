#Secret for RDS Proxy
/*
resource "aws_secretsmanager_secret" "rds_secret" {
  name = "rds-proxy-secret"
  description = "Secret for RDS Proxy"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({ //what you want to store
    "username"             = "my_username"
    "password"             = "my_password"
    "engine"               = "mysql"
    "host"                 = aws_db_instance.database.address
    "port"                 = 3306
    "dbInstanceIdentifier" = aws_db_instance.database.id
  })
}
*/