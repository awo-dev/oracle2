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
    [2]* ) ./includes/linux/setup_network.sh;;
    [q]* ) echo "Exiting program."; break;;
    * ) echo "Select one of the possibilities. Try again.";
  esac
done

echo "Program done."
echo "FQDN = $fqdn";
echo "Internal: $internalIP";
echo "External: $externalIP";
