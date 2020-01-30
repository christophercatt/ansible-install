#!/bin/bash

dir="/home/ansible-play"

if [ ! -d "$dir" ]
then
	mkdir "$dir" && cd "$dir"
	apt-get install -y python2.7 python-pip
	pip install -U virtualenv

	virtualenv .venv
	source .venv/bin/activate
	pip install ansible

	touch hosts
else
	if [[ "$VIRTUAL_ENV" != "" ]]
	then
		pip install -U ansible
	else
		virtualenv .venv
		source .venv/bin/activate
		pip install ansible

		touch hosts
	fi
fi
