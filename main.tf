module "network" {
  source       = "./modules/network"
  region       = var.region
  network_cidr = var.network_cidr
  azone        = var.azone
  public       = var.public
  private      = var.private
}

module "eks" {
  source        = "./modules/eks"
  instance_type = var.instance_type
  vpc           = module.network.vpc_id
  private_sub   = module.network.private_subnets
  min = var.min
  max = var.max
  desired = var.desired
}

module "docker_ecr_cpmanifest" {
  source          = "./modules/docker_ecr_cpmanifest"
  region          = var.region
  repository_list = var.repository_list
  host_docker     = var.host_docker
}

module "deploy" {
  source          = "./modules/deployment"
  region          = var.region
  profile         = var.profile
  app_eks_cluster = var.app_eks_cluster
  repository_list = var.repository_list

  depends_on = [module.eks, module.docker_ecr_cpmanifest]
}

