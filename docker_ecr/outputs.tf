output "ecr_image_url" {
  value = "${aws_ecr_repository.repository.repository_url}:latest"
}