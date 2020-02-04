# ansible-install

Note: This is a work in progress and is currently undergoing testing and improvements.


This is a lightweight install script to install Ansible within a Python3 virtual environment (for extra security).
To change install location, simply change the path within the $dir variable.


## Usage


* Make sure git is installed:

      sudo apt install git

* Clone this Repo to desired download folder:

      git clone https://github.com/christophercatt/ansible-install.git

* Change directory into Repo:

      cd ansible-install/

* Run install script as 'sudo' user:

      sudo ./ans-install.sh

* To default into the virtual environment and start using anisible, use:

      ansible-go

<br/>
Note: to use 'ansible-go' command, please either log out or open a new terminal session for alias to take effect or change directory to that specified in $dir within the script and run:

      source venv/bin/activate

<br/>
Use the following to exit the virtual environment:

      deactivate
<br/>

## To-Do
- [ ] Testing
- [x] Add Alias to user's .bashrc file
- [x] Update to use Python 3
- [x] Add module to add ansible-go command to .bashrc
- [x] Fix bug where virtual environment isn't activated
