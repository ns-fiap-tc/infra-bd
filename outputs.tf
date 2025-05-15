output "rds_endpoint" {
  value       = aws_db_instance.lanchonete_database.endpoint
  description = "Host do banco"
}