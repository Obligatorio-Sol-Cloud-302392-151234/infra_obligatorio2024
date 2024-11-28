module "docker_ecr" {
  source          = "modules/docker_ecr_cpmanifest"
  region          = var.region
  repository_list = var.repository_list
}