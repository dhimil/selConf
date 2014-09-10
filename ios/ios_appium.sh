#!/bin/bash

THIS=`dirname $0`
source $THIS/../log.sh
LOG_DIR=`realpath $THIS/../log`

if [ -z $1 ]
then
	log "Add device ID for execution"
	exit 1
fi

device=$1
mkdir -p $LOG_DIR

# Prepare the device for appium
bash $APPIUM_HOME/reset.sh --ios --real-safari --verbose --code-sign 'iPhone Developer'

# Starts iOS webkit proxy at port 27753 -> Appium is particular about the port
# brew install ios_webkit_debug_proxy
ios_webkit_debug_proxy -c $device:27753 >> $LOG_DIR/webkit_proxy.log &

# Starts appium for device on port 5555
node $APPIUM_HOME/bin/appium.js -U $device --safari --log $LOG_DIR/appium.log --log-timestamp --port 4567
