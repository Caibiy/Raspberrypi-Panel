#!/bin/bash
function menu {
   clear
   echo -e "\t\t\tSys Admin Menu\n"
   echo -e "\t1. Display disk space"
   echo -e "\t2. Display logged on users"
   echo -e "\t3. Display memory usage"
   echo -e "\t0. Exit program\n\n"
   echo -en "\t\tEnter options:"
   read -n 1 option
}
#1.Display disk space
function diskSpace {
echo "disk space"
}
#2.Display logged on users
function loggedUsers {
echo "users"
}
#Display memory usage
function memoryUsage {
 echo "memory"
}
#Exit
function exit {
 echo "exit"
}
menu
case $option in
0)
 break ;;
1)
 diskSpace;;
2)
 loggedUsers;;
3)
 memoryUsage;;
*)
 clear
 echo "Sorry,wrong selection";;
esac
