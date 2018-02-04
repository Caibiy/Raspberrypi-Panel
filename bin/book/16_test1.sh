#!/bin/bash
#Testing signal trapping
#
trap "echo ' Sorry! I have the trapped Ctrl-C'" SIGINT
#
echo This is a test Script
#
count=1
while [ $count -le 10 ]
do
   echo "Loop $count"
   sleep 1
   count=$[  $count+1 ]
done
echo "This is the end of the test script"
