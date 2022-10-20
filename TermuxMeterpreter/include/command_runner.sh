#!bin/bash

function run_command () {
	echo
	echo " => Use '!quit_runner' to exit"
	while true
	do
		read -p " [?] Command: " command
		if [[ "${command}" == "!quit_runner" ]]; then
			break
		fi
		$command
	done
}
