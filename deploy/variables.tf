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

