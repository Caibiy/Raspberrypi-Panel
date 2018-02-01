#!/bin/bash
exec 3>testfile2
echo "This is the test line of data">&3
exec 3>&-
cat testfile2
exec 3>testfile2
echo "This is bad">&3
