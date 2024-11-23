module "eks" {
  source = "./eks"
  instance_type = var.instance_type
}