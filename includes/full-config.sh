#!/bin/bash
fqdn=$1;
internalIP=$2;
externalIP=$3;

# Setup Network
echo "Setting up network."
./includes/linux/setup_network.sh $fqdn $internalIP $externalIP;

# Setup Hosts
echo "Setting up hosts file"
./includes/linux/setup_hosts.sh $fqdn $subdomain $externalIP;;

# Setup Formsweb
echo "Changing hostname in formsweb.xml"
./includes/oracle/formsweb.sh $fqdn;;

# Setup Oracle WLS vHosts
echo "Changing hostname in WLS virtual host"
./includes/oracle/vhosts.sh $fqdn;;

# Create SSL Certificates
echo "Generating SSL Certificates"
./includes/linux/letsencrypt.sh $fqdn;;

# Lets Encrypt Automatic Renwal
echo "Setting up automatic renwal of SSL certificates"
./includes/linux/le-autorenew.sh

# Configure ORDS
echo "Configuring ORDS"
./includes/oracle/ords.sh;;

# Craete vHosts for Apache
echo "Configures Apache and Tomcat"
./includes/linux/apache_add_vhost.sh
