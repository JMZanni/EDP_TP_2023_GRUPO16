#!/usr/bin/env bash

# Ruta de la carpeta con las imágenes
carpeta="./imagenes"

# Obtener la lista de nombres de archivos válidos
archivos_validos=$(ls "$carpeta" | grep -E '^[A-Z][a-z]+ [A-Z][a-z]+$')

# Imprimir la lista de nombres de archivos válidos
echo "Nombres de archivos válidos:"
for archivo in $archivos_validos; do
# ruta_archivo="$carpeta/$archivo"
  echo "$archivo"
done
