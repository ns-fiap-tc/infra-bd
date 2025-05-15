data "aws_eks_cluster" "lanchonete_cluster" {
  name = "lanchonete_cluster"
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.aws_eks_cluster.lanchonete_cluster.name
}

data "aws_vpc" "lanchonete_vpc" {
  filter {
    name   = "cidr"
    values = ["10.0.0.0/16"]
  }

  filter {
    name   = "tag:Name"
    values = ["lanchonete_vpc"]
  }
}

data "aws_subnet" "lanchonete_private_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["lanchonete_private_subnet_1"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.lanchonete_vpc.id]
  }

  filter {
    name   = "cidrBlock"
    values = ["10.0.3.0/24"]
  }
}

data "aws_subnet" "lanchonete_private_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["lanchonete_private_subnet_2"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.lanchonete_vpc.id]
  }

  filter {
    name   = "cidrBlock"
    values = ["10.0.4.0/24"]
  }
}