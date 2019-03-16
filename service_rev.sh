#!/bin/bash

#脚本功能: 修改/home/dev/svn/avatar/trunk/services_rev.txt ,指定要修改的版本号 比如  service_rev 11234 脚本将找出service_rev下最大的版本号,和输入的版本号对比,将所有的版本号替换成最大的版本号 

#参数1 小版本号


function replaceToMaxVer()
{  
    ver=$1
        `sed -i "/^#/!{s/[0-9]\{5,\}/${ver}/}" $DIR`
        echo "success modify all version to $ver"
        exit
}

#service_rev 路径
DIR="/home/dev/svn/avatar/trunk/services_rev.txt"
if [ ! -f "$DIR" ]
then
#如果文件不存在,结束
echo "no such file in your system: ${DIR}"
exit 1
fi

ver="$1"
#修改系统的小版本号
if [ -z "$ver" ]
then 
#如果系统或者版本号不存在,结束
echo "wrong version you give me!"
exit 1
fi

maxVer=`sed -n '/^#/!p' $DIR | awk '{print $5}' | sort -nur | sed -n '1p'`

if [ $maxVer -gt $ver ]
then
echo " your version is lower than maxversion in service_rev !"
newVer=$maxVer
else
newVer=$ver
fi

replaceToMaxVer $newVer


