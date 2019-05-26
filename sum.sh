#!/bin/bash
SUM=0
echo
while :
do
read  -p  "请输入一个整数（0表示结束）："  x
    [[ $x -eq 0 ]]  &&  break
#   SUM=$[SUM+x]
    let SUM+=x
done
echo "总和是：$SUM"
