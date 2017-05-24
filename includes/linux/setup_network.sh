#!/bin/bash
# This is for setting up the networking.

source ./includes/setVars.sh

fqdn=$1;     # my-domain.tld
external=$2; # 10.174.234.x
internal=$3; # 10.0.3.x

echo "Hostname = $fqdn";
echo "Internal = $internal";
echo "External = $external";

#nmcli g hostname $fqdn; # Only RHEL7
#Change hostname
hostname $fqdn;
sed -e "/sbsv12l6master/c HOSTNAME=$fqdn" /etc/sysconfig/network > new_network
mv /etc/sysconfig/network /etc/sysconfig/network.original
mv new_network /etc/sysconfig/network

nmcli con mod eth0 ipv4.addr $external ipv4.gateway 10.174.234.1
nmcli con mod eth1 ipv4.addr $internal

echo "Network has been changed."

echo;
