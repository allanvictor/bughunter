#!/bin/bash

nucleibot (){

	local domain=$1
	local subdomain_file=$2	

	if [ -z "$2" ]
	then
		sudo tmux new -d -s nucleibotdomain 
	        sudo tmux send-keys -t nucleibotdomain "subfinder -d ${domain} -silent -o /tmp/subdomains-nuclei.${domain} | httpx -silent | nuclei -c 50 -t /root/nuclei-templates -severity critical,high,low | notify -silent" C-m
		sudo tmux detach -s nucleibotdomain
	else
		tmux new -s nucleibotfile "cat ${subdomain_file} | httpx -silent | nuclei -c 50 -t /root/nuclei-templates -severity critical,high,low | notify -silent"
	fi
}
