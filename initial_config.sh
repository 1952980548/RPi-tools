#!/bin/bash

if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root! Try 'sudo %s'\n" $0
  exit 1
fi


. /usr/bin/raspi-config nonint

do_hostname rpi-$(cut -d: -f4- < /sys/class/net/eth0/address | tr -d :)
do_wifi_country BE
do_change_timezone "Europe/Brussels"
do_boot_behaviour B1 #B1=console, B3=Desktop, n+1=autologon
do_boot_wait 1
do_boot_splash 1

# interfaces
do_ssh 0
do_spi 0
do_i2c 0
do_onewire 0