#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install salt-minion
sudo echo -e "master: '#put your ip here'\nid: minion4"|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion.service
