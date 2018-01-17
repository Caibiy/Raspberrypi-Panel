#!/bin/bash
#copy the /usr directory listing to a log file
todady=`date +%y%m%d`
ls /usr > log.$todady
