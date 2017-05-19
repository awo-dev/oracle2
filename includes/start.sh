#!/bin/bash

source ./includes/setVars.sh
init; # Setting vars to empty

echo "";

echo "Choose one of the following possibilities:"
echo " 1 - Testing FQDN"
echo " 2 - Testing IP"
echo " q - Exit"

while true; do
  read -p "Choice: " choice
  case $choice in
    [1]* ) fqdn=$(promptValue "Enter a valid FQDN (fx my-domain.tld): ");;
    [2]* ) getIP; ip=$(promptValue "Enter ip (ex: 5): 10.174.234."); internalIP="10.174.234.$ip/24"; externalIP="10.0.3.$ip/24";;
    [q]* ) echo "Exiting program."; break;;
    * ) echo "Select one of the possibilities. Try again.";
  esac
done

echo "Program done."
echo "FQDN = $fqdn";
echo "Internal: $internalIP";
echo "External: $externalIP";
