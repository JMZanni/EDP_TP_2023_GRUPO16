#!/usr/bin/env bash

BANDERA=0

function menu  {
	echo "Elija una Accion"
	echo "1-Generar"
	echo "2-Descomprimir"
	echo "3-Procesar"
	echo "4-Comprimir"
	echo "5-Salir"
}
function opcion1 {
    case $1 in
        0)
            while true
	    do
                read -p "Introduzca la cantidad de imágenes a generar: " n
                if [[ $n =~ ^[0-9]+$ ]] && [ $n -gt 0 ]
		then
                    bash "generar.sh" $n
                    BANDERA=1
                    menu
                    break
                else
                    echo "El valor ingresado no es un número entero positivo. Intenta nuevamente."
                fi
            done
            ;;
        1) echo "Ya se han generado imágenes" ;;
        2) echo "Ya se han generado y descomprimido imágenes";;
        3) echo "Ya se han generado y procesado imágenes";;
        4) echo "Ya se han generado y comprimido imágenes";;
    esac

}

function opcion2 {
	case $1 in
	1)
	ARCHIVO="imagenes.tar.gz"
	CHECKSUM="checksum.txt"
	bash "descomprimir.sh" $ARCHIVO $CHECKSUM
	BANDERA=2
	menu
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
	echo "Imagenes Procesadas"
	BANDERA=3
	menu
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
	menu
	;;
        0) echo "No se han generado imagenes previamente";;
        1) echo "No se han descomprimido imagenes previamente";;
        2) echo "No se han procesado imagenes previamente" ;;
        4) echo "Ya se han generado y comprimido imagenes" ;;
	esac
}

PS3='Seleccione>'
echo "Elija una acci�n"
select opcion in "Generar" "Descomprimir" "Procesar" "Comprimir" "Salir"
do

	[ -e $opcion ] && echo "No ha elegido una opci�n v�lida" && continue
	[ $REPLY == 1 ] && opcion1 $BANDERA && continue
	[ $REPLY == 2 ] && opcion2 $BANDERA && continue
        [ $REPLY == 3 ] && opcion3 $BANDERA && continue
        [ $REPLY == 4 ] && opcion4 $BANDERA && continue
	[ $REPLY == 5 ] && echo "Ha salido del script" && break
done



exit 0
