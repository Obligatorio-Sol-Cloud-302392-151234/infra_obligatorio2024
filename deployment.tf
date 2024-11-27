module "deploy" {

  source          = "./deploy"
  region          = var.region
  profile         = var.profile
  app_eks_cluster = var.app_eks_cluster
  repository_list = var.repository_list

  depends_on = [module.eks, module.docker_ecr]

}