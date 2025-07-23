output "rds_endpoint" {
  value       = aws_db_instance.lanchonete_database.endpoint
  description = "Host do banco lanchonete"
}

output "rds_categoria_endpoint" {
  value       = aws_db_instance.lanchonete_categoria_database.endpoint
  description = "Host do banco categoria"
}

output "rds_produto_endpoint" {
  value       = aws_db_instance.lanchonete_produto_database.endpoint
  description = "Host do banco produto"
}