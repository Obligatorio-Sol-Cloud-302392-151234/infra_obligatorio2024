resource "aws_vpc" "prod_app_vpc" {
  cidr_block           = var.network_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-prod-app"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public)
  vpc_id                  = aws_vpc.prod_app_vpc.id
  cidr_block              = element(var.public, count.index)
  availability_zone       = element(var.azone, count.index)
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "prevate_subnet" {
  count                   = length(var.private)
  vpc_id                  = aws_vpc.prod_app_vpc.id
  cidr_block              = element(var.private, count.index)
  availability_zone       = element(var.azone, count.index)
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}


