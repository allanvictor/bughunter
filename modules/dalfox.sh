#!/bin/bash

Dalfox () {
        local PS3='Select Dalfox bot options: '
	while true; 
	do
		select answerdalfox in "Return" "Run Dalfox with a Domain" "Run Dalfox with a Domain list"
		do
        		case $REPLY in
				1)
					break 2
				;;
				2)
					local domain
					read -r -p "Set a Domain: " domain
					dalfoxbot ${domain} 
				;;
                		3) 
					local domainfile
					read -r -p "Set a Domain list file: " domainfile
					dalfoxbot 'list'  ${domainfile} 
				;;
        		esac
			break
		done
	done
}
