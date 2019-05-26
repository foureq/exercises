#!/bin/bash
read -p '请您输入用户名:' n
[ -z $n ] && echo '没有输入,程序退出!' && sleep 5 && exit || useradd $n
stty -echo
read -p '请您输入密码:' mima
stty echo
echo
echo
[ -z $mima ] && echo '没有输入密码,只创建用户!' && sleep 5 || echo "$mima" | passwd --stdin $n  &> /dev/null 
[ ! -z $mima ] && if [ $? -eq 0 ]; then echo "用户 $n 身份验证令牌已经成功更新。" ;fi
id $n
0 ]; then echo "用户 $n 身份验证令牌已经成功更新。" ;fi
id $n
