#!/bin/bash

source ./includes/fqdn.sh

echo "Choose one of the following possibilities:"
echo " 1 - Testing FQDN"

while true; do
  read -p "Choice: " choice
  case $choice in
    [1]* ) getFQDN; break;;
    [q]* ) echo "Exiting program."; break;;
    * ) echo "Select one of the possibilities. Try again.";
  esac
done

echo "Program done."
echo "FQDN = $fqdn";
