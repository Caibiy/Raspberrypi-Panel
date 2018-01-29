#!/bin/bash
for file in ../*
 do
  if [ -d "$file" ]
  then
    echo "$file is a directory"
  elif [ -f "$file" ]
   then
    echo "$file is a file"
  fi
done
