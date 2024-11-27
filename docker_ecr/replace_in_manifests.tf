resource "local_file" "k8s_manifests" {
  for_each = aws_ecr_repository.repository

  filename = "generated/${each.key}.yaml"

  # Leer el archivo y reemplazar {{docker_img}} con la URL del repositorio
  content = replace(
    file("manifests/${each.key}/kubernetes-manifests.yaml"),
    "{{docker_img}}",
    "${each.value.repository_url}:latest"
  )
}
