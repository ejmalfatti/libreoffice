#!/bin/bash
# -- UTF 8 --

function crear_Dir(){
	if [ -d "$HOME/tmp" ]; then
		cd $HOME/libreoffice
		chown -R $USER:$USER $HOME/libreoffice
	else
		mkdir -p $HOME/libreoffice
		chown -R $USER:$USER $HOME/libreoffice
		cd $HOME/libreoffice
	fi
}

function lb_Espaniol(){
	apt-get -y install libreoffice-l10n-es
}

function lb_Ortografia(){
	apt-get -y install myspell-es aspell aspell-es
}

function lb_LanguageTool(){
	#sudo apt-get -y install openoffice.org-java-common # Java para OpenOffice 
	apt-get -y install libreoffice-java-common # Java para LibreOffice
	DOWN="http://www.languagetool.org/download/LanguageTool-2.8.oxt"

	crear_Dir # llamando a la funcion que crea el directorio tmporal	
	
	dirActual=$(pwd)
	
	if [ "$dirActual" == "$HOME/libreoffice" ]; then
		if [ -f "$HOME/LanguageTool-2.8.oxt" ]; then
			echo "El fichero \"LanguageTool-2.8.oxt\" existe"
		else
			echo "Descargando la extensión LanguageTool-2.8.oxt..."
			echo; sleep 1
			wget -c $DOWN
		fi
	else
		echo "No se ha podido descargar la extensión..."
	fi	
}

function lb_Extensiones(){
	es_AR="http://ufpr.dl.sourceforge.net/project/aoo-extensions/1503/3/diccionarios-argentina_1.oxt"
	es_ES_AL="http://extensions.libreoffice.org/extension-center/diccionario-espanol/releases/1.0/spanish-dictionary.oxt"
	es_ES="subirlo a copy"

	crear_Dir # llamando a la funcion que crea el directorio tmporal	

	TRUE="true"
	local opt
	while [ "$TRUE" == "true" ];do
		echo " 1) Diccionario español Argentino - v 1.1.1"
		echo " 2) Diccionario español Español y America Latina - v 0.5"
		echo " 3) Diccionario español Español - v 0.6"
		echo " 4) Salir de este menu"
		read -p " Ingrese el numero de la accion que desar realizar: " opt
		clear
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
done
}

function lb_Apariencia(){
	apt-get -y install libreoffice-style-crystal libreoffice-style-galaxy libreoffice-style-hicontrast libreoffice-style-human libreoffice-style-oxygen libreoffice-style-sifr libreoffice-style-tango
}

TRUE="true"
while [ "$TRUE" == "true" ]; do
	echo "      ....:::: Menú principal ::::...."
	echo
	echo " 1) Instalar el idioma español en Libre Office"
	echo " 2) Instalar los diccionarios desde los repositorios"
	echo " 3) Descargar extensiones para Libre Office (Ortográfia)"
	echo " 4) Instalar set de iconos para Libre Office"
	echo " 5) Salir de este menú"
	echo
	read -p " Elija la opcion que desea ejecutar: " opt
	clear
	case $opt in
		1)
			;;
		2)
			;;
		3)
			;;
		4)
			;;
		5)
			echo "Saliendo..."; sleep 2
			clear
			exit 0
			;;
	esac
done

#	Fuentes:
#	http://extensions.libreoffice.org/extension-center/languagetool
#	http://extensions.libreoffice.org/extension-center/diccionario-espanol
#	http://extensions.services.openoffice.org/en/project/diccionario_es_AR
