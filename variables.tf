variable "region" {
  description = "Variable de Región"
}

variable "network_cidr" {
  description = "Variable para CIDR"
}

variable "azone" {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  description = "Variable para la AZ"
}

variable "public" {
  type        = list(string)
  description = "Variable de Subnet publica"
}

variable "private" {
  type        = list(string)
  description = "Variable de Subnet privada"
}

variable "instance_type" {
  description = "Variable tipo de instancia"
}

variable "profile" {
  description = "Variable de Perfil de usuario"
}

variable "app_eks_cluster" {
  description = "Variable de nombre de Cluster"
}

variable "repository_list" {
  description = "Variable lista de nombres de repositorios"
}

variable "host_docker" {
  description = "Variable configuracion de host segun SO"
}

