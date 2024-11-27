#!/bin/bash
aws eks update-kubeconfig --region $1 --name $2 --alias $2 --profile $3
# Directorio base
REPO_DIR="./generated"
 
# Buscar todos los archivos .yaml en microservicios

find "$REPO_DIR" -type f -name "*.yaml" | while read -r yaml_file; do
  echo "Ejecutando archivo: $yaml_file"
  
  # Ejecutar el archivo YAML usando kubectl
  kubectl apply -f "$yaml_file"
  
#  sleep 10

   Comprobar si el comando fue exitoso
  if [ $? -eq 0 ]; then
 	echo "Archivo $yaml_file ejecutado correctamente."
  else
    echo "Error al ejecutar $yaml_file."
  fi
done

# find "$REPO_DIR" -type f -name "*.yaml" | while read -r yaml_file; do
#   if grep -q "\${" "$yaml_file"; then
#     echo "Error: Variables no reemplazadas en $yaml_file"
#     exit 1
#   fi
#   echo "Aplicando archivo: $yaml_file"
#   kubectl apply -f "$yaml_file"
# done