#!/bin/sh
grep 'apnic|CN|ipv4' delegated-apnic-latest | cut -f 4,5 -d '|' | tr '|' ' ' >ip.txt
