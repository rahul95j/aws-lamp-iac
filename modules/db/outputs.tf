output "db_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.webapp-db.address
  sensitive   = true
}

output "db_port" {
  description = "RDS instance port"
  value       = aws_db_instance.webapp-db.port
  sensitive   = true
}

output "db_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.webapp-db.username
  sensitive   = true
}

output "db_endpoint" {
  value = aws_db_instance.webapp-db.endpoint
}