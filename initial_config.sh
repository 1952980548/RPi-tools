#!/bin/bash

if [ $(id -u) -ne 0 ]; then
  printf "Script must be run as root! Try 'sudo %s'\n" $0
  exit 1
fi

# once latest raspi-config is released, that should be used
RASPI_CONFIG="$(dirname "$(readlink -f "$0")")/raspi_config nonint"

echo Updating system settings...
$RASPI_CONFIG do_hostname rpi-$(cut -d: -f4- < /sys/class/net/eth0/address | tr -d :)
$RASPI_CONFIG do_wifi_country 'BE'
$RASPI_CONFIG do_change_timezone 'Europe/Brussels'
$RASPI_CONFIG do_configure_keyboard 'be'
$RASPI_CONFIG do_boot_behaviour B1 #B1=console, B3=Desktop, n+1=autologon
$RASPI_CONFIG do_boot_wait 1
$RASPI_CONFIG do_boot_splash 1

# interfaces
$RASPI_CONFIG do_ssh 0
$RASPI_CONFIG do_spi 0
$RASPI_CONFIG do_i2c 0
$RASPI_CONFIG do_onewire 0

#TODO: add nmct user & disable pi
