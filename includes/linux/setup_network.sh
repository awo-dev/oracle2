#!/bin/bash
# This is for setting up the networking.

if [ -z "$fqdn" ]; then
  echo "FQDN has not been set.";
  getFQDN;
fi

echo "FQDN = $fqdn";
