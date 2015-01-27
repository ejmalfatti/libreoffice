#!/bin/bash
# -- UTF 8 --
##====================================
##      Autor: Emanuel Malfatti
##      Contacto: ejmalfatti@outlook.com
##      Licencia: GPL v2
##      Fecha: 27-01-2015 11:38
##====================================

function crear_Dir(){
	if [ -d "$HOME/libreoffice" ]; then
		#chown -R $USER:$USER $HOME/libreoffice
		cd $HOME/libreoffice
	else
		mkdir -p $HOME/libreoffice
		#chown -R $USER:$USER $HOME/libreoffice
		cd $HOME/libreoffice
	fi
}

function lb_Espaniol(){
	clear
	echo " Instalando el idioma español para LibreOffice"
	echo; sleep 1
	apt-get -y install libreoffice-l10n-es
	echo
	read -p "Proceso terminado. Presione cualquier tecla..." S
	clear
}

function lb_Ortografia(){
	clear
	echo " Instalando los diccionarios desde repositorios"
	echo; sleep 1
	apt-get -y install myspell-es aspell aspell-es
	echo
	read -p "Proceso terminado. Presione cualquier tecla..." S
	clear
}

function lb_LanguageTool(){
	#sudo apt-get -y install openoffice.org-java-common # Java para OpenOffice 
	clear
	echo " Instalando Java para LibreOffice"
	echo; sleep 2
	apt-get -y install libreoffice-java-common # Java para LibreOffice
	echo
	read -p "Proceso terminado. Presione cualquier tecla..." S
	
	DOWN="http://www.languagetool.org/download/LanguageTool-2.8.oxt"

	crear_Dir # llamando a la funcion que crea el directorio tmporal	
	
	dirActual=$(pwd)
	
	if [ "$dirActual" == "$HOME/libreoffice" ]; then
		clear
		echo " Descargando la extensión LanguageTool-2.8.oxt..."
		echo; sleep 1
		wget -c $DOWN
		echo
		read -p "Proceso terminado. Presione cualquier tecla..." S
		clear
	else
		clear
		echo " No se ha podido descargar la extensión..."
		sleep 2
		clear
	fi	
}

function lb_Extensiones(){
	clear
	es_AR="http://ufpr.dl.sourceforge.net/project/aoo-extensions/1503/3/diccionarios-argentina_1.oxt"
	es_ES_AL="http://extensions.libreoffice.org/extension-center/diccionario-espanol/releases/1.0/spanish-dictionary.oxt"
	es_ES="https://copy.com/KjXNoKRj3mZaFHrs/es_ES.oxt"

	crear_Dir # llamando a la funcion que crea el directorio tmporal	

	TRUE="true"
	local opt
	while [ "$TRUE" == "true" ];do
		echo " 1) Diccionario español Argentino - v 1.1.1"
		echo " 2) Diccionario español Español y America Latina - v 0.5"
		echo " 3) Diccionario español Español - v 0.6"
		echo " 4) Salir de este menu"
		read -p " Ingrese el numero de la accion que desea realizar: " opt
		clear
		case $opt in
				1)
					clear
					echo "Descargando la extensión español Argentino..."
					echo; sleep 1
					wget -c $es_AR
					echo
					read -p "Proceso terminado. Presione cualquier tecla..." S
					clear
					;;
				2)
					clear
					echo "Descargando diccionario Español y America Latina..."
					echo; sleep 1
					wget -c $es_ES_AL
					echo
					read -p "Proceso terminado. Presione cualquier tecla..." S
					clear
					;;
				3)
					clear
					echo "Descargando diccionario español Español..."
					echo; sleep 1
					wget -c $es_ES
					echo
					read -p "Proceso terminado. Presione cualquier tecla..." S
					clear
					;;
				4)
					break
					;;
		esac		
done
}

function lb_Apariencia(){
	clear
	echo "Instalando los iconos para LibreOffice"
	echo; sleep 1
	apt-get -y install libreoffice-style-crystal libreoffice-style-galaxy libreoffice-style-hicontrast libreoffice-style-human libreoffice-style-oxygen libreoffice-style-sifr libreoffice-style-tango
	echo
	read -p "Proceso terminado. Presione cualquier tecla..." S
	clear
}
function main(){
	TRUE="true"
	while [ "$TRUE" == "true" ]; do
		echo
		echo " .......::::::: Configuración de LibreOffice :::::::......."
		echo
		echo " 1) Instalar el idioma español en Libre Office"
		echo " 2) Instalar los diccionarios desde los repositorios"
		echo " 3) Descargar extension LanguageTool para Libre Office (50 MB aprox.)"
		echo " 4) Descargar extensiones para LibreOffice (2 MB c/u aprox.)"
		echo " 5) Instalar set de iconos para Libre Office"
		echo " 6) Salir de este menú"
		echo
		local opt
		read -p " Elija la opcion que desea ejecutar: " opt
		clear
		case $opt in
			1)
				lb_Espaniol
				;;
			2)
				lb_Ortografia
				;;
			3)
				lb_LanguageTool
				;;
			4)
				lb_Extensiones
				;;
			5)
				lb_Apariencia
				;;
			6)
				echo " Saliendo..."; sleep 2
				clear
				exit 0
				;;
		esac
	done
}

# Bloque principal. Llamando a la función main()

main

#	Fuentes:
#	http://extensions.libreoffice.org/extension-center/languagetool
#	http://extensions.libreoffice.org/extension-center/diccionario-espanol
#	http://extensions.services.openoffice.org/en/project/diccionario_es_AR
