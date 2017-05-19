#!/bin/bash
# This is for setting up the networking.

source ./includes/setVars.sh

external=$1; # 10.174.234.x
internal=$2; # 10.0.3.x

echo "internal = $internal";
echo "external = $external";
