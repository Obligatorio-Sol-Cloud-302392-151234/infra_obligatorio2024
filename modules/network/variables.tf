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







