resource "aws_ssm_parameter" "db_username" {
  name  = "/lanchonete/db_username"
  type  = "SecureString"
  value = var.db_username
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/lanchonete/db_password"
  type  = "SecureString"
  value = var.db_password
}
