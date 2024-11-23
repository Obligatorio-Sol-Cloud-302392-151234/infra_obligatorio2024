module "deploy" {
    source = "./deploy"
    depends_on = [module.eks]
}