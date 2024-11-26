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

variable "adservice_img" {}
variable "manifest_adservice" {}