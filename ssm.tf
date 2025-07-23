resource "aws_ssm_parameter" "db_lanchonete_username" {
  name  = "/lanchonete/db_lanchonete_username"
  type  = "SecureString"
  value = var.db_lanchonete_username
}

resource "aws_ssm_parameter" "db_lanchonete_password" {
  name  = "/lanchonete/db_lanchonete_password"
  type  = "SecureString"
  value = var.db_lanchonete_password
}

resource "aws_ssm_parameter" "db_categoria_username" {
  name  = "/lanchonete/db_categoria_username"
  type  = "SecureString"
  value = var.db_categoria_username
}

resource "aws_ssm_parameter" "db_categoria_password" {
  name  = "/lanchonete/db_categoria_password"
  type  = "SecureString"
  value = var.db_categoria_password
}

resource "aws_ssm_parameter" "db_produto_username" {
  name  = "/lanchonete/db_produto_username"
  type  = "SecureString"
  value = var.db_produto_username
}

resource "aws_ssm_parameter" "db_produto_password" {
  name  = "/lanchonete/db_produto_password"
  type  = "SecureString"
  value = var.db_produto_password
}

resource "aws_ssm_parameter" "db_pagamento_username" {
  name  = "/lanchonete/db_pagamento_username"
  type  = "SecureString"
  value = var.db_pagamento_username
}

resource "aws_ssm_parameter" "db_pagamento_password" {
  name  = "/lanchonete/db_pagamento_password"
  type  = "SecureString"
  value = var.db_pagamento_password
}
