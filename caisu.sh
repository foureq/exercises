#!/bin/bash
a=$[$RANDOM%100]
b=0
while :
  do
    let b++
    echo
    read -p '请您输入一个100以内的整数:' s
    [ "$s" == '*' ] && s=''
    if [ ! -z $(echo $s | sed 's/[0-9]//g') ] || [ "$s" == "" ] || [ $s -gt 100 ];then
      echo "请您输入100以内的整数."
    elif [ $s -eq $a ];then
      echo "恭喜您$b次就猜对了."
      echo
      exit
    elif [ $s -gt $a ];then
      echo '猜大了.'
    else
      echo '猜小了.'
    fi
  done









  
#if [ $s -eq $a ];then
#  echo '恭喜您猜对了.'
#elif [ $s -gt $a ];then
#  echo '猜大了.'
#  echo "正确答案是 $a."
#else
#  echo '猜小了.'
#  echo "正确答案是 $a."
#fi
  
