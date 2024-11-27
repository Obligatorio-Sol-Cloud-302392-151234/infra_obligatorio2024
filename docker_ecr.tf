module "docker_ecr" {
  source          = "./docker_ecr"
  region          = var.region
  repository_list = var.repository_list
}