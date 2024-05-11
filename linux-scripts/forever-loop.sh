#!/usr/bin/env bash
#
# Run a forever loop.
#

function forever(){
  echo
  echo "Hello, DevESP... today is `date`"
  echo
}

while true
  do
    forever  
    sleep 10
  done  
