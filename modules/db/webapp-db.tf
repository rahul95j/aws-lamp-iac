resource "aws_db_subnet_group" "webapp-db" {
  name       = "webapp-db"
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

  tags = {
    Name = "webapp-db"
  }
}

resource "aws_db_instance" "webapp-db" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  port                   = 3306
  vpc_security_group_ids = [var.allow_sql_sg]
  db_subnet_group_name   = aws_db_subnet_group.webapp-db.name
  multi_az               = true
  name                   = "webapp-db"
  identifier             = "mysqldb"
  username               = "admin"
  password               = "password"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  tags = {
    Name = "webapp-db"
  }
}

output "endpoint" {
  value = aws_db_instance.webapp-db.endpoint
}