#!/bin/bash
# Look before you leap
#
jump_directory=/home/baduser
#
if [ -d $jump_directory ]
then
  echo "The directory $jump_directory  exisit"
  cd $jump_directory
  ls
else
  echo "The $jump_directory does  not exisit"
fi
