module "deploy" {
  source          = "./deploy"
  region          = var.region
  profile         = var.profile
  app_eks_cluster = var.app_eks_cluster

  adservice_img = var.adservice_img
  manifest_adservice = var.manifest_adservice

  depends_on = [module.eks]
}