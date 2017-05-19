#!/bin/bash
# This is for setting up the networking.

source ./includes/setVars.sh

fqdn=$1:     # my-domain.tld
external=$2; # 10.174.234.x
internal=$3; # 10.0.3.x

echo "fqdn = $fqdn";
echo "internal = $internal";
echo "external = $external";
