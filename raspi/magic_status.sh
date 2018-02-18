#!/bin/sh
if pm2 show serveronly | grep -E -i -q online ; then
  echo 正在运行
else
  echo 未启动
fi
