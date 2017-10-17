#!/bin/bash
# if not root, run as root
RED='\033[0;31m'
NC='\033[0m' # No Color
if (( $EUID != 0 )); then
    sudo /home/cfletcher/apt-upgrade.sh
    exit
fi
printf "${RED}apt-get update${NC}\n"
apt-get update
printf "${RED}apt-get upgrade${NC}\n"
apt-get upgrade
printf "${RED}apt-get dist-upgrade${NC}\n"
apt-get dist-upgrade
printf "${RED}apt-get autoclean${NC}\n"
apt-get autoclean
printf "${RED}apt-get autoremove${NC}\n"
apt-get autoremove
