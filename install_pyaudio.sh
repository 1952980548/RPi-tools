#!/bin/bash
if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root! Try 'sudo %s'\n" $0
  exit 1
fi

apt update -y && apt install -y libportaudio2 portaudio19-dev
nmct-box/bin/python -m pip install --upgrade pyaudio


