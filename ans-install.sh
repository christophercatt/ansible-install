#!/bin/bash


## Customisable install location
dir="/home/ansible-play"

## Checks if install directory exists
if [ ! -d "$dir" ]
then

	## Makes install directory and CD into it
	mkdir "$dir" && cd "$dir"
	## Install dependencies and create empty hosts file for later use
	apt install -y python3.7 python3.7-dev python3.7-venv python3-venv
	touch hosts
	## Setup virtual environment
	python3.7 -m venv venv
	source venv/bin/activate
	## Install Ansible packages
	pip install --upgrade pip
	pip install ansible

else

	## If install directory already exists, check status of hosts file
	if [ ! -f "$dir/hosts" ]
	then
		## If no hosts file is found, make one
		touch hosts
	fi

	## Checks if virtual environment environmental variable has been set
	if [[ "$VIRTUAL_ENV" != "" ]]
	then
		## Upgrade Ansible if ne updates available
		pip install --upgrade ansible
	else
		## If venv environmental variable doesn't exist, setup venv
		python3.7 -m venv venv
		source venv/bin/activate
		## Install Ansible packages
		pip install --upgrade pip
		pip install ansible
	fi
fi
