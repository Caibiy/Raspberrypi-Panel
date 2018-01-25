#!/bin/bash
case $USER in
root|study)
    echo "Hello,$USER"
    echo "please enjoy your visit";;
*)
    echo "Sorry,you are not allowed here";;
esac
