resource "docker_image" "repository" {
    depends_on = [ aws_ecr_repository.repository ]
    for_each = toset(var.repository_list)
    name = "${aws_ecr_repository.repository[each.key].repository_url}:latest"
    
    build {
        path = "microservicios/src/${each.key}"
        dockerfile = "Dockerfile"
    }
  keep_locally = false
}

resource "docker_registry_image" "repository_push" {
    for_each = toset(var.repository_list)
    name = "${aws_ecr_repository.repository[each.key].repository_url}:latest"

  depends_on = [docker_image.repository]  # Asegura que la imagen se construya antes del push.
}


#resource "null_resource" "remove_docker_image" {
#  for_each = toset(var.repository_list)
  
#  depends_on = [docker_registry_image.repository_push]
  
#  provisioner "local-exec" {
#    command  = "docker rmi ${docker_image.repository[each.key].name}"
#  }
#}