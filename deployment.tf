module "deploy" {
  source          = "./deploy"
  region          = var.region
  profile         = var.profile
  app_eks_cluster = var.app_eks_cluster
  depends_on      = [module.eks]
}