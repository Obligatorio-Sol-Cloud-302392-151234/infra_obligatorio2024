data "aws_iam_role" "labrole-arn" {
  name = "LabRole"
}
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.21"

  cluster_name    = "app_eks_cluster"
  cluster_version = "1.26"

  cluster_endpoint_public_access = true

  vpc_id                   = var.vpc
  subnet_ids               = var.subnets
  control_plane_subnet_ids = var.subnets
  iam_role_arn             = data.aws_iam_role.labrole-arn.arn
  create_iam_role          = false
  enable_irsa              = false

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t3.micro"]

  }

  eks_managed_node_groups = {
    workers = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types           = [var.instance_type]
      capacity_type            = "ON_DEMAND"
      iam_role_arn             = data.aws_iam_role.labrole-arn.arn
      iam_instance_profile_arn = data.aws_iam_role.labrole-arn.arn
      create_iam_role          = false
      create_role              = false

    }
  }
}