#!/usr/bin/env bash


ls imagenes/ > lista_imagenes_total.txt

ls imagenes_procesadas/ > lista_imagenes_validas.txt

CANTIDAD_A=0

for arch in imagenes_procesadas/*
do
	NOMBRE=$(basename "$arch")
	if [[ $NOMBRE =~ a$ ]]
	then
#	echo "$NOMBRE es válido"
	((CANTIDAD_A++))
	fi
done

echo $CANTIDAD_A > cantidad_A.txt

tar zcvf resultado_imagenes.tar.gz imagenes/ imagenes_procesadas/ lista_imagenes_total.txt lista_imagenes_validas.txt cantidad_A.txt

exit 0
