#!/bin/bash

echo -e "\033[0;32m******************************\033[0m"
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
echo -e "\033[0;32m******Author:JiaDong Yang*****\033[0m"
echo -e "\033[0;32m******************************\033[0m"

#add anything
git add .
#
msg="rebuild project `date`"
if [ $# -eq 1 ] 
then
    msg=$1
fi
#commit
git commit -m "$msg"
#push
git push origin master
