#!/usr/bin/env bash

#GENERACION DE LISTAS
#Creo la lista de nombres totales y de validos válidas
ls imagenes/ > lista_imagenes_total.txt
ls imagenes_procesadas/ > lista_imagenes_validas.txt

#CONTEO DE NOMBRES FINALIZADOS EN A
#Creamos la variable para contar nombres que finalizan con la letra "a"
CANTIDAD_A=0

#Iteramos en los archivos de la carpeta "imagenes procesadas"
for arch in imagenes_procesadas/*
do
	#Extraemos el nombre del archivo (Nombre y Apellido de la persona)
	NOMBRE=$(basename "$arch")
	#Solo realizamos el conteo si el Nombre de la persona finaliza con la letra
	if [[ $NOMBRE =~ (^[A-Za-z]+a [A-Za-z]+$) ]]
	then
	#Si se cumple lo anterior, suma una unidad al conteo de CANTIDAD_A
	((CANTIDAD_A++))
	fi
done

#Guardamos la cantidad de personas con Nombre finalizado en "a" en un archivo de texto
echo $CANTIDAD_A > cantidad_A.txt

#COMPRESION DE TODO LO ANTERIOR
tar zcvf resultado_imagenes.tar.gz imagenes/ imagenes_procesadas/ lista_imagenes_total.txt lista_imagenes_validas.txt cantidad_A.txt

#BORRADO DE ARCHIVOS CREADOS
rm -r imagenes/
rm -r imagenes_procesadas/
rm lista_imagenes_total.txt
rm lista_imagenes_validas.txt
rm cantidad_A.txt

exit 0
