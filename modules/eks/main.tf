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
  subnet_ids               = var.private_sub
  control_plane_subnet_ids = var.private_sub
  iam_role_arn             = data.aws_iam_role.labrole-arn.arn
  create_iam_role          = false
  enable_irsa              = false

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t3.micro"]

  }

  eks_managed_node_groups = {
    workers = {
      min_size     = 2
      max_size     = 3
      desired_size = 2

      instance_types           = [var.instance_type]
      capacity_type            = "ON_DEMAND"
      iam_role_arn             = data.aws_iam_role.labrole-arn.arn
      iam_instance_profile_arn = data.aws_iam_role.labrole-arn.arn
      create_iam_role          = false
      create_role              = false

    }
  }
node_security_group_additional_rules = {
  ingress_rule = {
    description = "Allow all inbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    type = "ingress"
  }
  egress_rule = {
   description = "Allow all outbound traffic"
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"] 
   type = "egress"
  }
}
}