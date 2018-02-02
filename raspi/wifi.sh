#! /bin/sh
path=/etc/wpa_supplicant/wpa_supplicant.conf
wifiname=$1
wifipass=$2
if [ -e $path ];then
   if [ -n $wifiname ]&& [ -n $wifipass ];then
      echo "请输入wifi名和密码" 
   else
      echo "wifi名字:$wifiname,wifi密码$wifipass"
      echo "正在写入配置....."
       
   fi
else
  echo "文件不存在"
fi
