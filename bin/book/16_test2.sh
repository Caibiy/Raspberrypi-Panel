#!/bin/bash
#Trapping the script Exit
#
trap "echo Goodbye.....JiaDong" EXIT
#
count=1
while [ $count -le 5 ]
do
   echo "Loop $count"
    sleep 1
    count=$[ $count+1 ]
done

