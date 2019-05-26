#!/bin/bash
ip=`ifconfig eth0 | awk '/inet /{print $2}'`
echo "本地IP地址是:"$ip
cpu=`uptime | awk '{print $NF-2} | sed 's/,//'`            
#awk中NF为当前行的列数，$NF是最后一列
echo "本机CPU最近15分钟的负载是:"$cpu
net_in=`ifconfig eth0 | awk '/RX p/{print $5/1024/1024"MB"}'`
echo "入站网卡流量为:"$net_in
net_out=`ifconfig eth0 | awk '/TX p/{print $5}'`
echo "出站网卡流量为:"$net_out
mem=`free | awk '/Mem/{print $4}'`
echo "内存剩余容量为:"$mem
disk=`df | awk '/\/$/{print $4}'`
echo "根分区剩余容量为:"$disk
user=`cat /etc/passwd |wc -l`
echo "本地账户数量为:"$user
login=`who | wc -l`
echo "当前登陆计算机的账户数量为:"$login
process=`ps aux | wc -l`
echo "当前计算机启动的进程数量为:"$process
soft=`rpm -qa | wc -l`
echo "当前计算机已安装的软件数量为:"$soft
