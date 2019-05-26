#!/bin/bash
for i in `seq 25`
do
ping -c 3 -i 0.2 -W 1 172.25.0.$i &> /dev/null
if [ $? -eq 0 ];then
  echo "PING通172.25.0.$i"
else
  echo 'PING不通'
fi
done
