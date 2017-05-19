#!/bin/bash

source ./includes/fqdn.sh

echo "Choose one of the following possibilities:"
echo " 1 - Testing FQDN"

# Optimize with a loop asking questions later. For now, this is just fine.
getFQDN;

echo "Program done."
echo "FQDN = $fqdn";
done
