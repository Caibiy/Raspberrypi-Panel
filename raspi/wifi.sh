#! /bin/sh
path=/etc/wpa_supplicant/wpa_supplicant.conf
wifiname=$1
wifipass=$2
#写入配置
write_wifi(){
     echo "network={
ssid=\"${wifiname}\"
psk=\"${wifipass}\"
}" >>$path
}

#检查配置
read_wifi(){
  echo "读取配置信息"
  cat $path | grep ssid

}
trap "echo Goodbye...." EXIT
if [ -e $path ];then
   if [ !-z $wifiname ] && [! -z $wifipass ];then
      echo "正在写入配置....."
      echo "wifi名字:$wifiname,wifi密码$wifipass"
      write_wifi
   else
      echo "请输入wifi名和密码" 
   fi
else
  echo "文件不存在"
fi
