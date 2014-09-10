#!/bin/bash

bash android/selendroid.sh >> log/selendroid.log &
bash android/android_appium.sh >> log/android_appium.log &
bash ios/ios_appium.sh c2d4f1d16617e17c5b824b652a1cea1cbf6b74a9 >> log/ios_appium.log &

