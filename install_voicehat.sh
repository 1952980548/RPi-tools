#!/bin/bash
if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root! Try 'sudo %s'\n" $0
  exit 1
fi

DIR=/tmp/seeed-voicecard
git clone https://github.com/respeaker/seeed-voicecard.git $DIR
pushd $DIR
./install.sh 2mic
popd
rm -rf $DIR
