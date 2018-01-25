#!/bin/bash
#check if either a directory or file exists
#
location=/home/study/
file=nowdate
if [ -e $location ];then
   echo "The $location driection is exists"
   if [ -e $location$file ];then
   echo "OK on the filename"
   date>$location$file
   else
   echo "The file does not exists"
   fi
else
  echo "The $location is not exists"
fi
