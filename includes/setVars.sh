#!/bin/bash
# This file is for retrieving all the variables from the user.

function promptValue() {
 read -p "$1""" val
 echo $val
}

function getIP() {
  ip=$(promptValue "Enter ip (ex: 5): 10.174.234.");
  internalIP="10.174.234.$ip";
  externalIP="10.0.3.$ip";
}

function getFQDN() {
  domain=$(promptValue "Enter domain name (fx my-domain.tld): ")
  subdomain=$(promptValue "Enter subdomain (fx sub (sub.my-domain.tld)): ")
  fqdn=$subdomain+$domain
  echo "FQDN = $fqdn";
}
