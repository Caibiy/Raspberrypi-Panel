#!/bin/bash
for(( a=1;a<=3;a++))
do
     echo "start loop $a";
     for(( b = 1; b<=3 ; b++))
     do
     echo "   inside loop $b"
    done
done
