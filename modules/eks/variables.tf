variable "instance_type" {
    description = "Variable tipo de instancia"
}

variable "vpc" {
    description = "Variable vpc para cluster"
}

variable "private_sub" {
    type = list(string)
    description = "Variable para subnet privada de cluster"
}