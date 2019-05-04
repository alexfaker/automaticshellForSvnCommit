#!/bin/bash
#Description:清除开发环境的大文件, mq日志, fastdfs日志, tmp下面的日志

#Author:yananqi
#Version:1.0
#CreateTime:2019-04-02 18:01:12

echo "start clean your dev encironment!"
#mq日志删除
`sudo rm -rf  /Data/apps/rabbitmq_manager/var/log/manager.log`
#fastdfs日志删除
`sudo rm -rf /Data/apps/fastdfs/data/storaged.log`
#邮件日志删除
`sudo rm -rf /var/mail/logcheck`
# /tmp 下yum相关日志删除
`sudo rm -rf /tmp/yum_*`
# /tmp 下日志删除
`sudo rm -rf /var/log/messages*`
`sudo rm -rf /var/log/maillog*`
`sudo rm -rf /var/log/maillog*`
echo "clean ok "

