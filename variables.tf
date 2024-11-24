variable "region" {
  type = string
  description = "Variable de Región" 
}

variable "network_cidr" {
  type        = string
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
  type        = string
  description = "Variable tipo de instancia"
}

variable "profile" {
  type = string
  description = "Variable de Perfil" 
}

variable "app_eks_cluster" {
  type = string
  description = "Variable de Cluster"  
}