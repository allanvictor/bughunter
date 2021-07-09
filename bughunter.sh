#!/bin/bash

GREEN='\033[01;32m'
GREENL='\033[00;37m'
HOMEPATH='/home/ubuntu/mobilebot/'
ROOTWORKDIR='/home/ubuntu/hunt/'
MODULESPATH="${HOMEPATH}modules/"
BOTSPATH="${HOMEPATH}bots/"

loadModules() {
 for module in `ls ${MODULESPATH}`; do
 	source ${MODULESPATH}${module}
 done
}

loadBots() {
 for bot in `ls ${BOTSPATH}`; do
 	source ${BOTSPATH}${bot}
 done
}

showBanner() {
	figlet -f /usr/local/lib/python3.8/dist-packages/pyfiglet/fonts/drpepper.flf "BUG HUNTER" -w 100 | lolcat
}

setOption() {
	option=( "Exit" "List Tmux Sessions" "Nuclei bot" "Dalfox bot" )
}


showBanner
echo -e "${GREEN}"
loadModules
loadBots
setOption
PS3="select a function: "
while true; 
do
	select answer in "${option[@]}";
	do
		case $REPLY in
        		1) 
		   		echo -e "${GREENL}"
		   		break 2
			;;
			2) 
		   		Tmux
			;;
			3)
				Nuclei
			;;
			4)
				Dalfox	
			;;
        		*) 
		   		echo "Invalid option $REPLY"
			;;
        	esac
		break
	done
done
