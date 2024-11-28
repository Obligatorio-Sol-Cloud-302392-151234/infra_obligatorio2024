variable "region" {}

variable "repository_list" {
    description = "Variable lista de repositorios"
    type = list  
}

variable "host_docker" {} 

variable "dockerfile_paths" {
  default = {
    "adservice"      = "microservicios/src/adservice"
    "cartservice"    = "microservicios/src/cartservice/src" 
    "checkoutservice" = "microservicios/src/checkoutservice"
    "currencyservice" = "microservicios/src/currencyservice"
    "emailservice"   = "microservicios/src/emailservice"
    "frontend"   = "microservicios/src/frontend"
    "loadgenerator" = "microservicios/src/loadgenerator"
    "paymentservice" = "microservicios/src/paymentservice"
    "productcatalogservice" = "microservicios/src/productcatalogservice"
    "recommendationservice" = "microservicios/src/recommendationservice"
    "shippingservice" = "microservicios/src/shippingservice"
  }
}