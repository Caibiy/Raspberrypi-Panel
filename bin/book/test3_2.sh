#!/bin/bash
#testing multiple commands in the then section
#
testuser=NoSuchUser
#
if grep $testuser /etc/passwd;then
   echo "first command"
   echo "second command"
   ls -a /home/$testuser/.b*
else
   echo "The user $testuser does not exist on this system."
   echo
fi
