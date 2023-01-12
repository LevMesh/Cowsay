#!/bin/bash

#-----------------------------------------------------------------------------#
#---------------------Function the check if port is free----------------------#
#-----------------------------------------------------------------------------#

Is_Port_Free() {

	is_port_allocated=$(nc -z localhost "$1" && echo "IN USE" || echo "FREE")
	if [ "$is_port_allocated" == "IN USE" ]; then
		echo -e "ERROR! Seems like port $1 is already in use...\nPlease run this script again and enter a new port"
		exit 1
	fi
}

#-----------------------------------------------------------------------------#
#--------------------------BUILDING THE DOCKER IMAGE--------------------------#
#-----------------------------------------------------------------------------#

echo "Preparing to build the docker image under the name 'cowsay:1.0'"
sleep 3

docker build -t cowsay:1.0 .

#-----------------------------------------------------------------------------#
#----------------------------PORT SETUP/SELECTION-----------------------------#
#-----------------------------------------------------------------------------#

echo -e "\nDeafult port was set to 8080\nIf you want a different port number please enter a port for the cow\nElse, Press Enter "
read cow_port

if [ -z "$cow_port" ]; then
	cow_port=8080
fi

#-----------------------------------------------------------------------------#
#---------------------------------Deployment----------------------------------#
#-----------------------------------------------------------------------------#


Is_Port_Free $cow_port 

docker run -d -p $cow_port:8080 cowsay:1.0

echo -e "Hey, The cow is now available at http://localhost:"$cow_port""

sleep 2

xdg-open http://localhost:$cow_port 2> /dev/null 


