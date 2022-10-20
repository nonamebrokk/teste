#!/bin/bash

function insert_bashrc() {
	read -p " [?] You want to remove the .bashrc (y/N)? : " remove

	# Deletar .bashrc
	if [[ "${remove}" == "yes" || "${remove}" == "y" ]]; then
		echo " => Deleting..."
		rm -rf "$HOME"/.bashrc
	fi

	read -p " [?] Insert the code here                  : " code
	echo "${code}" >> "$HOME"/.bashrc
	echo " => Code ejected!"
}
