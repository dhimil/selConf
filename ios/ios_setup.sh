#!/bin/bash

THIS=`dirname $0`
source $THIS/../log.sh

# List of iOS connected
number=`idevice_id -l | wc | awk '{print $1}'`

if [ "$number" == "1"  ]
then
  device=`idevice_id -l`
  log "Only one device found, using $device"
else
  log "Enter the device id: "
  read device
fi

# List of provision profile installed
cert_list=`ideviceprovision -u $device list | tail -n +2`

log "Cert list:\n$cert_list"
log "Reset all?"
read option

if [ "$option" == "y" ]
then
  echo "Removing certificates"
  for cert in "$cert_list\n"
  do
    cert_id=`echo $cert | awk '{print $1}'`
    echo "deleteing $cert_id"
    ideviceprovision -u $device remove $cert_id
  done
fi

log "Installing certificate"
ideviceprovision -u $device install conf.mobileprovision
