#!/bin/bash

__listSession () {
	tmuxsessions=()
	tmuxcommand=`sudo tmux ls | awk -F: '{print $1}'`
	for i in "${!tmuxcommand[@]}"; do
		tmuxsessions+=(${tmuxcommand[$i]})
	done
}

Tmux () {
	__listSession
        local PS3='Select a tmux session: '
	while true; 
	do
		select answertmux in "Return to menu" "${tmuxsessions[@]}"
		do
        		case $REPLY in
				1)
					break 2
				;;
                		*) 
					sudo /usr/bin/tmux a -t ${answertmux};
				;;
        		esac
			break
		done
	done
}
