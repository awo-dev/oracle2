#!/bin/bash

source ./includes/setVars.sh

echo "";

echo "Choose one of the following possibilities:"
echo " 1 - Testing FQDN"
echo " 2 - Testing IP"
echo " q - Exit"

if [ -z "$fqdn" ]; then
  echo "FQDN has not been set."
fi

while true; do
  read -p "Choice: " choice
  case $choice in
    [1]* ) getFQDN;;
    [2]* ) getIP;;
    [q]* ) echo "Exiting program."; break;;
    * ) echo "Select one of the possibilities. Try again.";
  esac
done

if [ -z "$fqdn" ]; then
  echo "FQDN has not been set."
fi

echo "Program done."
echo "FQDN = $fqdn";
echo "Internal: $internalIP";
echo "External: $externalIP";
