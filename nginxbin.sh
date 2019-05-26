#!/bin/bash
case $1 in
start|str)
  /usr/local/nginx/sbin/nginx;;
stop|sto)
  /usr/local/nginx/sbin/nginx -s stop;;
restart|res)
  /usr/local/nginx/sbin/nginx -s stop
  sleep 1
  /usr/local/nignx/sbin/nginx;;
status|sta)
  netstat -ntulp |grep -q nginx
  [ $? -eq 0 ] && echo '服务已启动' || echo '服务未启动';;
#  if [ $? -eq 0 ];then
#    echo '服务已启动'
#  else
#    echo '服务未启动'
#  fi;;
*)
  echo '开始str|停止sto|重启res|状态sta';;
esac
