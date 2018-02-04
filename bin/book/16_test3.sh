#!/bin/bash
#Modifying a set trap
#
trap "echo 'Sorry....Ctrl+c is trapped'" SIGINT
count=1
while [ $count -le 5 ]
do
  echo "Loop $count"
  sleep 1
  count=$[ $count +1 ]
done
trap "echo 'Sorry Ctral+c is trapped again'" SIGINT
count=1
while [ $count -le 5 ]
do  
  echo "Loop2 $count"
  sleep 1
  count=$[ $count + 1 ]
done
