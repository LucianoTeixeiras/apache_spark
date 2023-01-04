#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'
TEXT_GREEN='\e[1;32m'

sudo apt update -y
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

sudo apt dist-upgrade -y
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET

sudo apt upgrade -y
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET

sudo apt autoremove -y
echo -e $TEXT_YELLOW
echo 'APT auto remove finished...'
echo -e $TEXT_RESET

sudo apt install unzip zip git pip lsb-core -y
echo -e $TEXT_YELLOW
echo 'APT install finished...'
echo -e $TEXT_RESET

pip install --upgrade pip
echo -e $TEXT_YELLOW
echo 'UPD Pip finished...'
echo -e $TEXT_RESET

pip3 install --upgrade jinja2
echo -e $TEXT_YELLOW
echo 'UPD Jinja With Pip finished...'
echo -e $TEXT_RESET

sudo pip3 install ansible
echo -e $TEXT_YELLOW
echo 'Install Ansible with Pip3 finished...'
echo -e $TEXT_RESET

ansible-playbook 02-ubuntu.yml
echo -e $TEXT_YELLOW
echo 'Ansible Playbook finished...'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_GREEN
    echo 'Ubuntu Updated!!!'
    echo -e $TEXT_RESET
fi
