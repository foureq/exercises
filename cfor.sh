#!/bin/bash
ping -c 3 -i 0.2 -W 1 172.25.0.$1 &> /dev/null
if [ $? -eq 0 ];then
  echo 'PING通'
else
  echo 'PING不通'
fi
  
