resource "aws_vpc" "prod_app_vpc" {
  cidr_block           = var.network_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "prod_app_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public)
  vpc_id                  = aws_vpc.prod_app_vpc.id
  cidr_block              = element(var.public, count.index)
  availability_zone       = element(var.azone, count.index)
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count                   = length(var.private)
  vpc_id                  = aws_vpc.prod_app_vpc.id
  cidr_block              = element(var.private, count.index)
  availability_zone       = element(var.azone, count.index)
  map_public_ip_on_launch = "true"

  tags = {
    Name = "private_subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.prod_app_vpc.id

  tags = {
    Name = "internet_gw"
  }
}

resource "aws_eip" "public_ip" {
  domain = "vpc"

  depends_on = [aws_internet_gateway.internet_gw]
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.public_ip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  depends_on = [aws_internet_gateway.internet_gw]

  tags = {
    Name = "nat_gw"
  }
}



