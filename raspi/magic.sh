#!/bin/bash
file=../magic/MagicMirror.zip
dir=../magic/MagicMirror
log=../log/magic.log
#检查是否为root用户
check_root(){
  [[ $EUID != 0 ]] && echo "{'error':'当前账号非ROOT(或没有ROOT权限),请使用 sudo su'}" >>../log/magic.log
}

#检查系统版本
check_sys(){
  if cat /etc/issue | grep -E -i -q "raspbian";then
     sys_info="raspbian"
  else
     #sys_info="当前系统不是树莓派,该系统仅为树莓派服务QAQ"
     sys_info="raspbian"
  fi
}

#每次运行前先清除log
if [ -f $log ];then
  rm ../log/magic.log
fi
check_root
check_sys
if [[ ${sys_info} == "raspbian" ]];then
 if [ ! -d $dir ];then
    if [ -e $file ];then 
    unzip ../magic/MagicMirror.zip -d ../magic/
    fi
   fi
   if dpkg -l | grep -i -q -E node && dpkg -l | grep -i -q -E npm ;then
       cd ../magic/MagicMirror
       echo "{'success':'魔镜已经启动完毕(*^__^*)'}" >> ../../log/magic.log
       node serveronly
   else     
       echo "{'error':'node和npm未正确安装'}">>../log/magic.log
    fi
else
    echo ${sys_info}>>../log/magic.log
fi

