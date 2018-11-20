#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install salt-minion
sudo echo -e "master: 85.156.177.24\nid: minion4"|sudo tee /etc/salt/minion
sudo systemctl restart salt-minion.service
