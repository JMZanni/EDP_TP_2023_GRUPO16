#!/usr/bin/env bash

#La cantidad de imagenes sera el primer y unico argumento del script
CANT_IMG=$1

mkdir imagenes

#DESCARGA DE LISTA DE NOMBRES
#Descargamos la lista de nombres propuesta en el trabajo practico
URL="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"

NOMBRE_LISTA="lista_nombres.csv"

wget -O $NOMBRE_LISTA $URL

#Calculamos la cantidad de lineas del archivo de "lista_nombres.csv"
LINEAS=$(wc -l < $NOMBRE_LISTA)

#PROCESO DE DESCARGA DE IMAGENES
#Se descargaran imagenes segun la cantidad indicada como argumento en el script
#Se le asignara un nombre aleatorio de la lista de nombres 
for ((i=1; i<=$CANT_IMG; i++))
do

#DETERMINAR NOMBRE DE LA IMAGEN
#Determinamos un valor random entre 1 y el número de líneas de la lista de nombres:
NOMBRE_ALEATORIO=$((1 + $RANDOM % $LINEAS))

#Buscamos el nombre en la posición (linea) aleatoria determinada antes:
NOMBRE_IMAGEN=$(sed -n "${NOMBRE_ALEATORIO}p" $NOMBRE_LISTA)

#Cortamos hasta la coma en el nombre:
NOMBRE_CORREGIDO=$(echo $NOMBRE_IMAGEN | cut -d"," -f1)

#DESCARGAR IMAGEN
#Asignamos la dirección de la imagen
URL_IMAGEN="https://thispersondoesnotexist.com/"

#Utilizamos el comando "wget" para la descarga de imagenes
wget -O "imagenes/$NOMBRE_CORREGIDO" $URL_IMAGEN

#Para no saturar el servicio y evitarnos problemas, usamos sleep
sleep 1

done

#COMPRIMIR Y GENERAR CHECKSUM
#Comprimimos las imagenes. Para que sea en un solo archivo, utilizamos:
tar zcvf imagenes.tar.gz imagenes/

#Generamos Checksum y lo guardamos en un archivo
md5sum imagenes.tar.gz > checksum.txt

#Borramos la lista de nombres y la carpeta con imagenes sin comprimir
rm $NOMBRE_LISTA

rm -r "imagenes/"

exit 0
