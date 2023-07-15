#! /usr/bin/env bash

#Verificamos que se hayan proporcionado los 2 argumentos de archivo
if [ $# -ne 2 ]; then
    echo "Se deben proporcionar dos archivos como argumentos, archivo comprimido y checksum"
    exit 1
fi

ARCHIVO_COMPRIMIDO="$1"
CHECKSUM="$2"

#Se realiza la suma de verificacion
#El siguiente comando leera el archivo suma de verificacion "Checksum" y verificara que los archivos correspondientes a las sumas de verificacion contenidas en el archivo sean validas

md5sum -c --status "$CHECKSUM"
if [ $? -ne 0 ];then
	echo "La suma de verificacion es erronea"
	exit 1
fi

#Descomprimimos el archivo de imagenes

tar zxvf "$ARCHIVO_COMPRIMIDO"
if [ $? -ne 0 ]; then
	echo "No se pudo descomprimir el archivo de imagenes"
	exit 1
fi
echo "Archivo descomprimido correctamente!"

exit 0
