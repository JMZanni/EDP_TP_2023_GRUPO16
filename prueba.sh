#!/usr/bin/env bash

# Ruta de la carpeta con las imágenes
carpeta="./imagenes"

# Obtener la lista de nombres de archivos válidos
#archivos_validos=$(ls "$carpeta" | grep -E '')

#echo "$archivos_validos" > texto_pruebas.txt

# Imprimir la lista de nombres de archivos válidos
#echo "Nombres de archivos válidos:"
#for archivo in $archivos_validos; do
# ruta_archivo="$carpeta/$archivo"
#  echo "$archivo"
#done

for imagen in imagenes/*
do
	NOMBRE=$(basename "$imagen")
	if [[ $NOMBRE =~ (^[A-Z][a-z]+ [A-Z][a-z]+$) ]]
	then
	echo $NOMBRE
	#AQUI: PROCESAR Y GUARDAR EN /imagenes_procesadas
	fi
done

exit 0
