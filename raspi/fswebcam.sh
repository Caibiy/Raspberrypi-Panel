#!/bin/bash
if  [ `dpkg -l fswebcam  | grep fswebcam | wc -l` -ne 0 ];then
	echo "success"
else
	echo "error"
fi
