#!/bin/bash
if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root! Try 'sudo %s'\n" $0
  exit 1
fi
DIR=/tmp/snowboy
apt update -y && apt install -y swig libatlas-base-dev
git clone https://github.com/Kitt-AI/snowboy.git $DIR
WORKDIR=$PWD
pushd $DIR
$WORKDIR/nmct-box/bin/python setup.py build install
popd
rm -rf $DIR


