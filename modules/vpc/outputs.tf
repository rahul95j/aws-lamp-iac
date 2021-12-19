output "vpc_id" {
  value = aws_vpc.webapp-vpc.id
}

output "private_subnet_1_id" {
  value = aws_subnet.webapp-subnet-private-1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.webapp-subnet-private-2.id
}

output "public_subnet_1_id" {
  value = aws_subnet.webapp-subnet-public-1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.webapp-subnet-public-2.id
}

output "allow_ssh_sg" {
  value = aws_security_group.allow_ssh.id
}

output "allow_http_sg" {
  value = aws_security_group.allow_http.id
}

output "allow_sql_sg" {
  value = aws_security_group.allow_sql.id
}