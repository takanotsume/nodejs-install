#!/bin/bash   
#title           :nodejs-install.sh
#description     :This script will install node, npm and npm packages
#author		 :msim
#date            :20130102
#version         :0.1    
#usage		 :bash nodejs-install.sh
#==============================================================================
tput init
echo -e "If somebody tells you to jump, you ask how high !!!"
echo -e "--------------------------------------------"
sleep 1;
nodeNpmInstalled=0
if which node > /dev/null && which npm > /dev/null; then
	tput setf 2
	nodeNpmInstalled=1
   	echo -e "Nodejs and npm installed, please proceed"
else 
	tput setf 4
	read -p "Nodejs, npm not found! Install? (y/n)" -n 1
	echo -e ""
	tput init
	tput setf 7
   	if [[ $REPLY =~ ^[Yy]$ ]]; then
		tput init
   		if ! which node > /dev/null; then
			echo "Installing nodejs"	
			sudo add-apt-repository ppa:chris-lea/node.js
			sudo apt-get update
			sudo apt-get install nodejs 
   		fi
   		if ! which npm > /dev/null; then
			echo "Installing npm"
   			sudo apt-get install npm
   		fi
		tput setf 2
		nodeNpmInstalled=1
   		echo "Nodejs and npm should now be installed now"
   	else
		nodeNpmInstalled=0
   		echo "You should have accepted the challenges so that you can feel the exhilaration of victory."
   	fi
fi

# Check installed packages
npmPackagesInstalled=0
if [ $nodeNpmInstalled == 1 ]; then
    echo "npm is installed. Checking required packages: fs, redis"
    if ! npm list | grep --quiet fs; then
	npm install fs
	echo "npm fs installed"
    fi
    if ! npm list | grep --quiet redis; then
	npm install redis
	echo "npm redis installed"
    fi
    npmPackagesInstalled=1
fi
if [ $nodeNpmInstalled == 1 ] && [ $npmPackagesInstalled=1 ]; then
    echo "The cards are in your hands. Now it is up to you \"Pressure makes diamonds\""
fi
tput init
