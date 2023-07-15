#!/usr/bin/env bash

# Ruta de la carpeta
carpeta="./imagenes"

# Obtener la lista de nombres de archivos
#archivos=$(ls -p "$carpeta" | grep -v /)
archivos=$(ls "$carpeta" | grep -v '^[A-Z][a-z]+$')

# Imprimir la lista de nombres de archivos
echo "Archivos en la carpeta:"
for archivo in $archivos; do
  echo "$archivo"
done
