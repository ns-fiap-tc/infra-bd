# AWS provider configuration
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Database lanchonete configuration
variable "db_lanchonete_username" {
  description = "The username for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_lanchonete_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_lanchonete_name" {
  description = "Database lanchonete name"
  type        = string
  default     = "lanchdb"
}

variable "db_lanchonete_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
  default     = "lanchonete-db"
}

# Database categoria configuration
variable "db_categoria_username" {
  description = "The username for the RDS categoria instance"
  type        = string
  sensitive   = true
}

variable "db_categoria_password" {
  description = "The password for the RDS categoria instance"
  type        = string
  sensitive   = true
}

variable "db_categoria_name" {
  description = "Database categoria name"
  type        = string
  default     = "lanch_cat_db"
}

variable "db_categoria_identifier" {
  description = "The identifier for the RDS categoria instance"
  type        = string
  default     = "lanchonete-categoria-db"
}

# Database produto configuration
variable "db_produto_username" {
  description = "The username for the RDS produto instance"
  type        = string
  sensitive   = true
}

variable "db_produto_password" {
  description = "The password for the RDS produto instance"
  type        = string
  sensitive   = true
}

variable "db_produto_name" {
  description = "Database produto name"
  type        = string
  default     = "lanch_prod_db"
}

variable "db_produto_identifier" {
  description = "The identifier for the RDS produto instance"
  type        = string
  default     = "lanchonete-produto-db"
}

# Database pagamento configuration
variable "db_pagamento_username" {
  description = "The username for the RDS pagamento instance"
  type        = string
  sensitive   = true
}

variable "db_pagamento_password" {
  description = "The password for the RDS pagamento instance"
  type        = string
  sensitive   = true
}

variable "db_pagamento_name" {
  description = "Database pagamento name"
  type        = string
  default     = "lanch_pag_db"
}
