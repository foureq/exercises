#!/bin/bash
if [ $# -eq 0 ];then
  echo '请输入机台:(1-254)'  >&2
  exit 2
elif [ ! -z $(echo $1 | sed -nr '/^([0-9]{1,3}\.){3}[0-9]{1,3}\b/p') ] || [ ! -z $(echo $1 | sed -nr '/(^[0-9]+\.){3}[0-9]+\b/p') ];then
  if [ ! -z $(echo $1 | sed -nr '/^((2[0-4][0-9]|25[0-5]|[01]?[0-9]?[0-9])\.){3}(2[0-4][0-9]|25[0-4]|[01]?[0-9]?[0-9])\b/p') ];then
    ssh -X root@$1
    exit 0
  else
    echo "请您输入标准IP格式:0.0.0.1-->255.255.255.254"
    exit 2
  fi
elif [ "$1" == "rb" ];then
  rht-vmctl reset desktop
  exit 2
elif [ "$1" == "rs" ];then
  rht-vmctl reset server
  exit 2
elif [ "$1" == "rd" ];then
  rht-vmctl reset desktop
  exit 2
elif [ "$1" == "b" ];then
  ssh -X root@192.168.4.207
  exit 2
elif [ "$1" == "a" ];then
  ssh -X root@192.168.4.7
  exit 2
elif [ "$1" == "s" ];then
  ssh -X root@172.25.0.11
  exit 2
elif [ "$1" == "d" ];then
  ssh -X root@172.25.0.10
  exit 2
elif [ "$1" == "00" ];then
  \cp ~/.kh ~/.ssh/known_hosts
  exit 2
elif [ $1 -gt 254 ];then  
  echo '请输入机台:(1-254)'  >&2
  exit 2
else
  ssh -X root@176.121.212.$1 -p7920
fi
