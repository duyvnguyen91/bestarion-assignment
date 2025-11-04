output "db_instance_endpoint" {
  value       = module.rds.db_instance_endpoint
  description = "RDS endpoint"
}

output "db_instance_port" {
  value       = module.rds.db_instance_port
  description = "RDS port"
}

output "security_group_id" {
  value       = aws_security_group.this.id
  description = "Security group ID for RDS"
}

