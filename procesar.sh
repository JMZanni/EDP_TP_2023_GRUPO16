#!/usr/bin/env bash


if [ ! -d "imagenes_procesadas" ]
then
	mkdir -p "imagenes_procesadas"
fi

for imagen in imagenes/*
do
	NOMBRE=$(basename "$imagen")
	if [[ $NOMBRE =~ (^[A-Z][a-z]+ [A-Z][a-z]+$) ]]
	then
	convert "imagenes/$NOMBRE" -gravity center -resize 512x512+0+0 -extent 512x512 "imagenes_procesadas/$NOMBRE" 
	#AQUI: PROCESAR Y GUARDAR EN /imagenes_procesadas
	fi
done

exit 0
