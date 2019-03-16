#!/bin/bash

#�ű�����: �޸�/home/dev/svn/avatar/trunk/services_rev.txt ,ָ��Ҫ�޸ĵİ汾�� ����  service_rev 11234 �ű����ҳ�service_rev�����İ汾��,������İ汾�ŶԱ�,�����еİ汾���滻�����İ汾�� 

#����1 С�汾��


function replaceToMaxVer()
{  
    ver=$1
        `sed -i "/^#/!{s/[0-9]\{5,\}/${ver}/}" $DIR`
        echo "success modify all version to $ver"
        exit
}

#service_rev ·��
DIR="/home/dev/svn/avatar/trunk/services_rev.txt"
if [ ! -f "$DIR" ]
then
#����ļ�������,����
echo "no such file in your system: ${DIR}"
exit 1
fi

ver="$1"
#�޸�ϵͳ��С�汾��
if [ -z "$ver" ]
then 
#���ϵͳ���߰汾�Ų�����,����
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


