resource "aws_vpc" "practico-terraform-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "test-terraform-vpc"
  }
}

resource "aws_subnet" "practico-terraform-subnet" {
  vpc_id                  = aws_vpc.practico-terraform-vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "test-terraform-subnet"
  }
}
resource "aws_subnet" "practico-terraform-subnet2" {
  vpc_id                  = aws_vpc.practico-terraform-vpc.id
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "test-terraform-subnet2"
  }
}


