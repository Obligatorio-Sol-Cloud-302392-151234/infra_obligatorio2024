module "deploy" {

  source          = "./deploy"
  region          = var.region
  profile         = var.profile
  app_eks_cluster = var.app_eks_cluster
  repository_list = var.repository_list


  






  #adservice_img = var.adservice_img
  manifest_adservice = var.manifest_adservice
  #checkoutservice_img = var.checkoutservice_img
  manifest_checkoutservice = var.manifest_checkoutservice
  #currencyservice_img = var.currencyservice_img
  manifest_currencyservice = var.manifest_currencyservice
  #emailservice_img = var.emailservice_img
  manifest_emailservice = var.manifest_emailservice
  #frontend_img = var.frontend_img
  manifest_frontend = var.manifest_frontend
  #loadgenerator_img = var.loadgenerator_img
  manifest_loadgenerator = var.manifest_loadgenerator
  #paymentservice_img = var.paymentservice_img
  manifest_paymentservice = var.manifest_paymentservice
  #productcatalogservice_img = var.productcatalogservice_img
  manifest_productcatalogservice = var.manifest_productcatalogservice
  #recommendationservice_img = var.recommendationservice_img
  manifest_recommendationservice = var.manifest_recommendationservice
  #shippingservice_img = var.shippingservice_img
  manifest_shippingservice = var.manifest_shippingservice
  

  depends_on = [module.eks, module.docker_ecr]

}