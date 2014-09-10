#!/bin/bash

THIS=`dirname $0`
source $THIS/../log.sh

echo $ANDROID_HOME

if [ ! -f $THIS/selendroid-standalone.jar ]
then
	curl -O "https://github.com/selendroid/selendroid/releases/download/0.11.0/selendroid-standalone-0.11.0-with-dependencies.jar"
	mv selendroid-standalone-0.11.0-with-dependencies.jar $THIS/selendroid-standalone.jar
fi

# Start selendroid on port 5555
java -jar $THIS/selendroid-standalone.jar -port 5555 
