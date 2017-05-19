#!/bin/bash
# This file is for retrieving all the variables from the user.

function promptValue() {
 read -p "$1"": " val
 echo $val
}
