#!/bin/bash
# This file is for retrieving all the variables from the user.

function init() {
  fqdn="";
  externalIP="";
  internalIP="";
}

function getFQDN() {
  read -p "enter new FQDN (ex: my-domain.tld): " fqdn
}

function getIP() {
  read -p "Enter ip (ex: 5): 10.174.234." ip

  $externalIP="10.174.234.$ip/24"
  $internalIP="10.0.3.$ip/24"
}
