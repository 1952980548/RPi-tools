#!/bin/bash
if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root! Try 'sudo %s'\n" $0
  exit 1
fi

apt update -y && apt install -y python3-dev python3-venv 
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives --install /usr/bin/python python /usr/bin/python3.5 2

python -m venv nmct-box
nmct-box/bin/python -m pip install --upgrade pip setuptools wheel

echo  "alias boxenv='source /home/pi/nmct-box/bin/activate'" >> /.bashrc


