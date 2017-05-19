#!/bin/bash

source ./includes/setVars.sh

echo "";

echo "Choose one of the following possibilities:"
echo " 1 - Testing FQDN"
echo " 2 - Testing IP"
echo " 3 - Setup Network"
echo " q - Exit"

while true; do
  read -p "Choice: " choice
  case $choice in
    [1]* ) getFQDN;;
    [2]* ) getIP;;
    [3]* ) # Setting up networking
      if [ -z "$fqdn" ]; then getFQDN; fi
      if [ -z "$ip" ]; then getIP; fi
      ./includes/linux/setup_network.sh $fqdn $internalIP $externalIP;;
    [q]* ) echo "Exiting program."; break;;
    * ) echo "Select one of the possibilities. Try again.";
  esac
done
