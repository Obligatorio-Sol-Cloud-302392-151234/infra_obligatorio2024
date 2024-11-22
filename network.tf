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
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.public_ip.id
  subnet_id     = var.public[0]

  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "nat_gw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.prod_app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.prod_app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "public_subnet_as" {
  count          = length(var.public)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_subnet_as" {
  count          = length(var.private)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_rt.id
}


