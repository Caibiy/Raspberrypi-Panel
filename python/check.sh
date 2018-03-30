#!/bin/bash
#check 
if [ `dpkg -l fswebcam | grep fswebcam | wc -l` -eq 0 ];then
	sudo apt-get -y install fswebcam	
fi
