/*
#sg_lambda sends requests to sg_rds_proxy
resource "aws_security_group" "sg_lambda" {
  vpc_id      = module.some_vpc.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
  
#sg_rds_proxy only accepts inbound (ingress) traffic from sg_lambda on port 3306/TCP
resource "aws_security_group" "sg_rds_proxy" {
  vpc_id      = module.some_vpc.vpc_id

  ingress {
    description      = "MySQL TLS from sg_lambda"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.sg_lambda.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

#sg_rds only accepts inbound traffic from sg_rds_proxy on port 3306/TCP
 resource "aws_security_group" "sg_rds" {
  vpc_id      = module.some_vpc.vpc_id

  ingress {
    description      = "MySQL TLS from sg_rds_proxy"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.sg_rds_proxy.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
*/