#!/bin/bash

cd /home/steam/spaceengineers
yes ''|./start.sh setup
echo "started server"
sleep 10
echo "retreiving details"
sleep 3


#./arma3server details
sleep 300
# infinite loop to keep it open for Docker
while true; do ./start.sh start; sleep 300; done
