variable "region" {
  type        = string
  description = "Variable de Región"
}

variable "app_eks_cluster" {
  type        = string
  description = "Variable de Cluster"
}

variable "profile" {
  type        = string
  description = "Variable de Perfil"
}

variable "repository_list" {
    description = "Variable lista de repositorios"
    type = list  
}



#adservice

variable "manifest_adservice" { 
  default = "."
  }
#checkoutservice

variable "manifest_checkoutservice" {
   default = "."
}
#currencyservice_

variable "manifest_currencyservice" {
   default = "."
}
#emailservice

variable "manifest_emailservice" {
   default = "."
}
#frontend

variable "manifest_frontend" {
   default = "."
}
#loadgenerator

variable "manifest_loadgenerator" {
   default = "."
}
#paymentservice

variable "manifest_paymentservice" {
   default = "."
}
#productcatalogservice

variable "manifest_productcatalogservice" {
   default = "."
}
#recommendationservice

variable "manifest_recommendationservice" {
   default = "."
}
#shippingservice

variable "manifest_shippingservice" {
   default = "."
}

