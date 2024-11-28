output "vpc_id" {
  value       = aws_vpc.prod_app_vpc.id
  sensitive   = true
}

output "vpc_cidr_block" {
  value       = aws_vpc.prod_app_vpc.cidr_block
  sensitive   = true
}

output "public_subnets" {
  value = [for subnet in aws_subnet.public_subnet : subnet.id]
  sensitive = true
}

output "private_subnets" {
  value = [for subnet in aws_subnet.private_subnet : subnet.id]
  sensitive = true
}