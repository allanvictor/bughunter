#!/bin/bash

Nuclei () {
        local PS3='Select Nuclei bot options: '
	while true; 
	do
		select answernuclei in "Return" "Run Nuclei with a Domain" "Run Nuclei with a Domain list"
		do
        		case $REPLY in
				1)
					break 2
				;;
				2)
					local domain
					read -r -p "Set a Domain: " domain
					nucleibot ${domain} 
				;;
                		3) 
					local domainfile
					read -r -p "Set a Domain list file: " domainfile
					nucleibot 'list'  ${domainfile} 
				;;
        		esac
			break
		done
	done
}
