#!/bin/bash

if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root! Try 'sudo %s'\n" $0
  exit 1
fi


# copy groups:
sudo usermod -aG $(id pi -Gn | sed 's/^pi //g' | sed 's/ /,/g') $USER
