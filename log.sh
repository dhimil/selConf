#!/bin/bash

set -x
set -e

function log() {
  echo -e "\n$@"
}

function realpath() {
	for f in "$@"
	do
		echo $(cd $(dirname $1); pwd)/$(basename $1);
	done
}

export APPIUM_HOME=<Your path>
export ANDROID_HOME=<Your path>