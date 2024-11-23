module "eks" {
  source        = "./eks"
  vpc           = aws_vpc.prod_app_vpc.id
  subnets       = aws_subnet.private_subnet[*].id
  instance_type = var.instance_type

}