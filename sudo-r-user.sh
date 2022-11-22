#!/bin/bash
#This scrip will create users and assign sudo right
#it will work well in Linux, RedHat,& Centos servers
#Run only as root user or with sudo access.
#AUTHOR Tezehtech
echo "enter the user name"
read name
sudo adduser $name
echo " please enter password"
read -s password
echo "$password" | sudo passwd "$name" --stdin
echo " user account created"
sudo lid $name
grep $name /etc/passwd
echo "granting full access to $name"
sudo echo "$name ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$name
sudo grep $name /etc/sudoers
echo "$name now has sudo right"

