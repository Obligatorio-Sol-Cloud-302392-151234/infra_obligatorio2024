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

variable "min" {
    description = "Variable minimo de nodos"
    default = 1
}

variable "max" {
    description = "Variable maximo de nodos"
    default = 2
}

variable "desired" {
    description = "Variable cantidad deseada de nodos"
    default = 1
}