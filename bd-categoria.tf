resource "aws_db_subnet_group" "lanchonete_db_categoria_subnet_group" {
  name       = "lanchonete_db_categoria_subnet_group"
  subnet_ids = [
    data.aws_subnet.lanchonete_private_subnet_1.id,
    data.aws_subnet.lanchonete_private_subnet_2.id
  ]

  tags = {
    Name = "Database Subnet Group"
  }
}

resource "aws_security_group" "lanchonete_db_categoria_sg" {
  name        = "lanchonete_db_categoria_sg"
  description = "Security group para o RDS Categoria"
  vpc_id      = data.aws_vpc.lanchonete_vpc.id

  # Regras de segurança (exemplo para permitir tráfego de dentro da VPC)
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]  # Permitir acesso de dentro da VPC
    from_port   = 5432  # A porta do PostgreSQL
    to_port     = 5432  # A porta do PostgreSQL
    protocol    = "tcp"
  }

   tags = {
     Name = "lanchonete_db_categoria_sg"
   }
}

# Database
resource "aws_db_instance" "lanchonete_categoria_database" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "16.6"
  instance_class       = "db.t3.micro"
  identifier           = var.db_categoria_identifier
  username             = var.db_categoria_username
  password             = var.db_categoria_password
  db_name              = var.db_categoria_name
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.lanchonete_db_categoria_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.lanchonete_db_categoria_subnet_group.name

  tags = {
    Name = "lanchonete_categoria_database"
  }
}