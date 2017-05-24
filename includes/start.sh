#!/bin/bash

source ./includes/setVars.sh

echo "";

echo "Choose one of the following possibilities:"
#echo " 1 - Testing FQDN"
#echo " 2 - Testing IP"
echo " 1 - Setup Network"
echo " 2 - Change Hosts Files"
echo " 3 - Change Formsweb"
echo " 4 - Change Oracle vHosts"
echo " 5 - Configure ORDS"
echo " 6 - Generate SSL Certificates using Lets Encrypt"
echo " 7 - Setup Lets Encrypt Automatic Renewal"
echo " 8 - Create Apache (httpd) virtual hosts"
echo " full - Full Configuration"
echo " q - Exit"

while true; do
  read -p "Choice: " choice
  case $choice in
    #[1]* ) getFQDN;;
    #[2]* ) getIP;;
    [1]* ) # Setting up networking
      if [ -z "$fqdn" ]; then getFQDN; fi
      if [ -z "$ip" ]; then getIP; fi
      ./includes/linux/setup_network.sh $fqdn $internalIP $externalIP;;
    [2]* )
      if [ -z "$fqdn" ]; then getFQDN; fi
      if [ -z "$ip" ]; then getIP; fi
      ./includes/linux/setup_hosts.sh $fqdn $subdomain $externalIP;;
    [3]* ) # Setting up forms.cfg
      if [ -z "$fqdn" ]; then getFQDN; fi
      ./includes/oracle/formsweb.sh $fqdn;;
    [4]* ) # Setting up Oracle vHosts
      if [ -z "$fqdn" ]; then getFQDN; fi
      ./includes/oracle/vhosts.sh $fqdn;;
    [5]* ) # Configure ORDS
      ./includes/oracle/ords.sh;;
    [6]* ) # Generate SSL Certificates using Lets Encrypt
      if [ -z "$fqdn" ]; then getFQDN; fi
      ./includes/linux/letsencrypt.sh $fqdn;;
    [7]* ) # Enable Lets Encrypt Automatic Renewal
      ./includes/linux/le-autorenew.sh;;
    [8]* ) # Create httpd vHosts
      if [ -z "$fqdn" ]; then getFQDN; fi
      ./includes/linux/apache_add_vhost.sh;;
    [full]* ) # Full Configuration
      if [ -z "$fqdn" ]; then getFQDN; fi
      if [ -z "$ip" ]; then getIP; fi
      ./includes/full-config.sh;;
    [q]* ) echo "Exiting program."; break;;
    * ) echo "Select one of the possibilities. Try again.";
  esac
done
