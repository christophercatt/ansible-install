#!/bin/bash

## This is a lightweight install script to install Ansible within a virtual environment.
## To change install location, simply change the path within the $dir variable.



## VARIABLES ##

## Customisable install location
dir="$HOME/ansible-play"



## FUNCTIONS ##

## Function to setup virtual environment and install Ansible within
setup_venv_ansible () {

        ## Setup virtual environment
        python3.7 -m venv venv
        source venv/bin/activate
        ## Install Ansible packages
        pip install --upgrade pip
        pip install ansible

	add_ansible_go
}

## Function to add ansible-go command to global .bashrc
add_ansible_go () {

	## Add ansible-go alias into .bashrc file
	sudo echo "alias ansible-go='cd $dir && source venv/bin/activate'" >> ~/.bashrc
	## Source .bashrc file to enable instant use of ansible-go command
	source ~/.bashrc

}



## MAIN ##



## Checks if install directory exists
if [ ! -d "$dir" ]
then

	## Makes install directory and CD into it
	sudo -u "$USER" mkdir "$dir"
	sudo chown -R "$USER":"$USER" "$dir"
	cd "$dir"
	## Install dependencies and create empty hosts file for later use
	sudo apt install -y python3.7 python3.7-dev python3.7-venv python3-venv
	touch hosts
	## Setup virtual environment and install Ansible
	setup_venv_ansible

else
	## CD to install directory
	cd "$dir"
	## If install directory already exists, check status of hosts file
	if [ ! -f "$dir/hosts" ]
	then
		## If no hosts file is found, make one
		touch hosts
	fi

	## Checks if virtual environment environmental variable has been set
	if [[ "$VIRTUAL_ENV" != "" ]]
	then
		## Upgrade Ansible if new updates available
		source venv/bin/activate
		pip install --upgrade ansible
	else
	        ## Setup virtual environment and install Ansible
	        setup_venv_ansible

	fi
fi
