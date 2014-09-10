#!/bin/bash

THIS=`dirname $0`
source $THIS/../log.sh

# Resets the mobile device and gets chromedriver (if needed)
$APPIUM_HOME/reset.sh --android --chromedriver-version 2.10 --verbose

# Starts appium for android chrome
node $APPIUM_HOME/bin/appium.js --browser-name chrome --port 4444
