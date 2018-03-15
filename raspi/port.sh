#!/bin/bash
#得到当前系统正在被使用的端口port
lsof -i -P -n | grep LISTEN | awk '{print $9}' | awk -F ':' 'BEGIN {ORS=","};{print $2}'
