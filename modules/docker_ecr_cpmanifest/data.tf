# Informacion sobre la identidad de la cuenta
data "aws_caller_identity" "current" {}

# token de autorizacion para acceder a EKS
data "aws_ecr_authorization_token" "token" {}

