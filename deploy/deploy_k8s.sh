#!/bin/bash

# Directorio base
REPO_DIR="./microservicios"
 
# Buscar todos los archivos .yaml en microservicios

find "$REPO_DIR" -type f -name "*.yaml" | while read -r yaml_file; do
  echo "Ejecutando archivo: $yaml_file"
  
  # Ejecutar el archivo YAML usando kubectl
  kubectl apply -f "$yaml_file"
  
  # Comprobar si el comando fue exitoso
  if [ $? -eq 0 ]; then
 	echo "Archivo $yaml_file ejecutado correctamente."
  else
    echo "Error al ejecutar $yaml_file."
  fi
done
