#!/bin/bash
# This file is for retrieving all the variables from the user.

function getFQDN() {
  read -p "enter new FQDN (ex: my-domain.tld): " fqdn
  return fqdn;
}

function getIP() {
  read -p "Enter ip (ex: 5): 10.174.234." ip
  return ip;
}
