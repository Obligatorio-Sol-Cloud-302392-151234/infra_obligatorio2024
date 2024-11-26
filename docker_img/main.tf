terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "adservice_img" {
  name         = "gs151234/adservice_img:latest"  # Nombre y etiqueta de la imagen
  build {
    context = "microservicios\\src\\adservice\\Dockerfile"  # Ruta al directorio que contiene tu Dockerfile
  }
  keep_locally = false  # No mantener la imagen localmente después de la construcción
}

# Recurso para subir la imagen al repositorio de Docker Hub
resource "docker_registry_image" "adservice_img_push" {
  name = docker_image.adservice_img.name  # Usa el nombre de la imagen construida
}