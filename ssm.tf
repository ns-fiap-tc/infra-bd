resource "aws_ssm_parameter" "db_user" {
  name  = "/lanchonete/db_user"
  type  = "SecureString"
  value = var.db_user
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/lanchonete/db_password"
  type  = "SecureString"
  value = var.db_password
}
