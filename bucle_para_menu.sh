#!/bin/bash

TRUE="true"

echo "1) Diccionario español Argentino - v 1.1.1"
echo "2) Diccionario español Español y America Latina - v 0.5"
echo "3) Diccionario español Español - v 0.6"
echo "4) Salir de este menu"
read -p "Ingrese el numero de la accion que desar realizar: " opt

while [ "$TRUE" == "true" ];do
	if [ "$opt" != "1" ] && [ "$opt" != "2" ] && [ "$opt" != "3" ]; then
		TRUE="false"
		case $opt in	
			4)
				break
				;;
			*)
				echo "Ingresaste la opcion incorrecta"
				break
				;;
		esac
	else		
		case $opt in
			1)
				wget -c $es_AR
				clear
				;;
			2)
				wget -c $es_ES_AL
				clear
				;;
			3)
				wget -c $es_ES
				clear
				;;

		esac
		echo "1) Diccionario español Argentino - v 1.1.1"
		echo "2) Diccionario español Español y America Latina - v 0.5"
		echo "3) Diccionario español Español - v 0.6"
		echo "4) Salir de este menu"		
		read -p "Ingrese el numero de la accion que desar realizar: " opt

	fi
done
