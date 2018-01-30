#!/bin/bash
#重定向循环输出
for((a =1;a<=10;a++))
do
   echo "The number is $a"
done > test.txt
