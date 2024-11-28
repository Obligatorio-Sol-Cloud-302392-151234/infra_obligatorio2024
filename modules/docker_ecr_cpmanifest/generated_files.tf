resource "local_file" "modified_files" {
  
  # Obtiene todos los archivos .yaml de la carpeta 'manifests' y subcarpetas
  for_each = fileset("manifests", "**/*.yaml")  

  # El archivo se guarda en 'generated', respetando la estructura original
  filename = "generated/${each.value}"  

  # Primero, lee el contenido del archivo original
  content = can(regex("{{docker_img}}", file("manifests/${each.value}"))) ? replace(
    file("manifests/${each.value}"),  # Lee el archivo de 'manifests'
    "{{docker_img}}",  # Busca el patrón '{{docker_img}}'
    "${aws_ecr_repository.repository[split("/", each.value)[0]].repository_url}:latest"  # Reemplaza con la URL del repositorio
  ) : file("manifests/${each.value}")  # Si no contiene el patrón, deja el archivo igual
}