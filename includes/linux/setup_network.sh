#!/bin/bash
# This is for setting up the networking.

source ./includes/setVars.sh

fqdn=$1;     # my-domain.tld
external=$2; # 10.174.234.x
internal=$3; # 10.0.3.x

echo "Hostname = $fqdn";
echo "Internal = $internal";
echo "External = $external";

#nmcli only for RHEL7
#nmcli g hostname $fqdn;
#nmcli con mod eth0 ipv4.addr $external ipv4.gateway 10.174.234.1
#nmcli con mod eth1 ipv4.addr $internal

#Change hostname
hostname $fqdn;
sed -e "/sbsv12l6master/c HOSTNAME=$fqdn" /etc/sysconfig/network > new_network
mv /etc/sysconfig/network /etc/sysconfig/network.original
mv new_network /etc/sysconfig/network

#Change eth0
sed -e "/10.174.234.98/c IPADDR=$external" /etc/sysconfig/network-scripts/ifcfg-eth0 > new_eth0
sed -e "/10.0.3.98/c IPADDR=$internal" /etc/sysconfig/network-scripts/ifcfg-eth1 > new_eth1

rm /etc/sysconfig/network-scripts/ifcfg-eth0
rm /etc/sysconfig/network-scripts/ifcfg-eth1

mv new_eth0 /etc/sysconfig/network-scripts/ifcfg-eth0
mv new_eth1 /etc/sysconfig/network-scripts/ifcfg-eth1

echo "Network has been changed."

echo;
