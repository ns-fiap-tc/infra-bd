# AWS provider configuration
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Database configuration
variable "db_username" {
  description = "The username for the RDS instance"
  type        = string
  sensitive   = true
  default     = ""
}

variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
  default     = ""
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "lanchdb"
}

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
  default     = "lanchonete-db"
}
