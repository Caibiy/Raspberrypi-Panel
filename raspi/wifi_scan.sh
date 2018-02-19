#!/bin/sh
iwlist=`echo linux | sudo -S iwlist scanning 2>/dev/null | grep -i -E 'essid' | sed '{
s/[[:space:]]//g
s/\"//g
}' | gawk -F: '{print $2}'`
wifi_list=""
for wifi in $iwlist
do
   wifi_list="$wifi,$wifi_list"
done
wifi_list=`echo $wifi_list |  sed 's/\(.*\),/\1/'`
wifi_status=`ping -c4 google.com | grep 'received' | awk -F',' '{print $2}' | awk '{print $1}'`
if [ 0 -eq $wifi_status ];then
   wifi_info="没有网络链接"
else
   wifi_info="有网络链接"
fi
wifi_name=`echo linux | sudo -S wpa_cli status | grep -w ssid | awk -F= '{print$2}'`
wifi_info="$wifi_name已连接,$wifi_info"
echo  "{\"wifis\":\"$wifi_list\",\"info\":\"$wifi_info\"}"
