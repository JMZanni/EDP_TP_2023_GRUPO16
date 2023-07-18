#!/usr/bin/env bash

#Creamos la carpeta para guardar imagenes
mkdir "imagenes_procesadas"

#Iteramos en la cantidad de imagenes de la carpeta "imagenes"
for imagen in imagenes/*
do
	#Extraemos el nombre de cada imagen
	NOMBRE=$(basename "$imagen")
	#Procesamos solo si el nombre y apellido comienzan con mayuscula
	if [[ $NOMBRE =~ (^[A-Z][a-z]+ [A-Z][a-z]+$) ]]
	then
	#Convertimos con ImageMagick y guardamos cada imagen en la carpeta imagenes procesadas con el mismo nombre
	convert "imagenes/$NOMBRE" -gravity center -resize 512x512+0+0 -extent 512x512 "imagenes_procesadas/$NOMBRE" 
	fi
done

exit 0
