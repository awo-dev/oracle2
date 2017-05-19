#!/bin/bash

source ./includes/setVars.sh

echo "";

echo "Choose one of the following possibilities:"
echo " 1 - Testing FQDN"
echo " 2 - Testing IP"
echo " 3 - Setup Network"
echo " 4 - Change Hosts Files"
echo " 5 - Change Formsweb"
echo " 6 - Change Oracle vHosts"
echo " 7 - Configure ORDS"
echo " 8 - Generate SSL Certificates using Lets Encrypt"
echo " 9 - Setup Lets Encrypt Automatic Renewal"
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
    [4]* )
      if [ -z "$fqdn" ]; then getFQDN; fi
      if [ -z "$ip" ]; then getIP; fi
      ./includes/linux/setup_hosts.sh $fqdn $subdomain $externalIP;;
    [5]* ) # Setting up forms.cfg
      if [ -z "$fqdn" ]; then getFQDN; fi
      ./includes/oracle/formsweb.sh $fqdn;;
    [6]* ) # Setting up Oracle vHosts
      if [ -z "$fqdn" ]; then getFQDN; fi
      ./includes/oracle/vhosts.sh $fqdn;;
    [7]* ) # Configure ORDS
      ./includes/oracle/ords.sh;;
    [8]* ) # Generate SSL Certificates using Lets Encrypt
    [q]* ) echo "Exiting program."; break;;
    * ) echo "Select one of the possibilities. Try again.";
  esac
done
