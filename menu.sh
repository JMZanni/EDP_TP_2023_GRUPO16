#!/usr/bin/env bash

BANDERA=0

function opcion1 {
	case $1 in
	0)
	read -p "Introduzca la cantidad de imagenes a generar: " n
	bash "generar.sh" $n
	BANDERA=1
	;;
	1) echo "Ya se han generado imagenes" ;;
	2) echo "Ya se han generado y descomprimido imagenes";;
	3) echo "Ya se han generado y procesado imagenes";;
	4) echo "Ya se han generado y comprimido imagenes";;
	esac

}

function opcion2 {
	case $1 in
	1)
	ARCHIVO="imagenes.tar.gz"
	CHECKSUM="checksum.txt"
	bash "descomprimir.sh" $ARCHIVO $CHECKSUM
	BANDERA=2
	;;
	0) echo "No se han generado imagenes previamente" ;;
	2) echo "Ya se han generado y descomprimido imagenes";;
	3) echo "Ya se han generado y procesado imagenes" ;;
	4) echo "Ya se han generado y comprimido imagenes" ;;
	esac
}

function opcion3 {
	case $1 in
	2)
	bash "procesar.sh"
	BANDERA=3
	;;
	0) echo "No se han generado imagenes previamente";;
        1) echo "No se han descomprimido imagenes previamente";;
        3) echo "Ya se han generado y procesado imagenes" ;;
        4) echo "Ya se han generado y comprimido imagenes" ;;
	esac
}

function opcion4 {
	case $1 in
	3)
	bash "comprimir.sh"
	BANDERA=4
	;;
        0) echo "No se han generado imagenes previamente";;
        1) echo "No se han descomprimido imagenes previamente";;
        2) echo "No se han procesado imagenes previamente" ;;
        4) echo "Ya se han generado y comprimido imagenes" ;;
	esac
}

PS3='Seleccione>'
echo "Elija una acción"
select opcion in "Generar" "Descomprimir" "Procesar" "Comprimir" "Salir"
do

	[ -e $opcion ] && echo "No ha elegido una opción válida" && continue
	[ $REPLY == 1 ] && opcion1 $BANDERA && continue
	[ $REPLY == 2 ] && opcion2 $BANDERA && continue
        [ $REPLY == 3 ] && opcion3 $BANDERA && continue
        [ $REPLY == 4 ] && opcion4 $BANDERA && continue
	[ $REPLY == 5 ] && echo "Ha salido del script" && break
	echo "1-Generar/2-Descomprimir/3-Procesar/4-Comprimir/5-Salir"
done



exit 0
