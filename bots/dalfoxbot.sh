#!/bin/bash

dalfoxbot (){

	local domain=$1
	local subdomain_file=$2	

	if [ -z "$2" ]
	then
		sudo tmux new -d -s dalfoxbotdomain 
	        sudo tmux send-keys -t dalfoxbotdomain "subfinder -d "${domain}" -silent -o subdomains-dalfox.${domain} | httpx -silent | dalfox pipe | notify -silent" C-m
		sudo tmux detach -s dalfoxbotdomain
	else
		tmux new -s dalfoxbotfile "cat ${subdomain_file} | httpx -silent | dalfox pipe | notify -silent"
	fi
}
