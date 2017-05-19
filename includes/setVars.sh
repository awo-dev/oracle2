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
  fqdn=$(promptValue "Enter a valid FQDN (fx my-domain.tld): ")
}
