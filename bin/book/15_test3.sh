#!/bin/bash
tempfile=$(mktemp test19.XXXXXX)
exec 3>$tempfile
echo "This writes write to $tempfile"
echo "This is the first line">&3
echo "This is the second line">&3
echo "Done creating the tempfile."
cat $tempfile
rm -f $tempfile 2>/dev/null
