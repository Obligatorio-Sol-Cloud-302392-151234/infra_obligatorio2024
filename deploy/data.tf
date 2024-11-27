data "aws_ecr_repository" "adservice" {
  name = "adservice"
}

data "aws_ecr_repository" "checkoutservice" {
  name = "checkoutservice"
}

data "aws_ecr_repository" "currencyservice" {
  name = "currencyservice"
}

data "aws_ecr_repository" "emailservice" {
  name = "emailservice"
}

data "aws_ecr_repository" "frontend" {
  name = "frontend"
}

data "aws_ecr_repository" "loadgenerator" {
  name = "loadgenerator"
}

data "aws_ecr_repository" "paymentservice" {
  name = "paymentservice"
}

data "aws_ecr_repository" "productcatalogservice" {
  name = "productcatalogservice"
}

data "aws_ecr_repository" "recommendationservice" {
  name = "recommendationservice"
}

data "aws_ecr_repository" "shippingservice" {
  name = "shippingservice"
}