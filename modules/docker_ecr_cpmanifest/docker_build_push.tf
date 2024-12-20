resource "docker_image" "repository" {
    depends_on = [ aws_ecr_repository.repository ]
    for_each = toset(var.repository_list)
    name = "${aws_ecr_repository.repository[each.key].repository_url}:latest"
    
    build {
        path = var.dockerfile_paths[each.key]
        dockerfile = "Dockerfile"
    }
  keep_locally = false
}

resource "docker_registry_image" "repository_push" {
    for_each = toset(var.repository_list)
    name = "${aws_ecr_repository.repository[each.key].repository_url}:latest"

  depends_on = [docker_image.repository]  
}
