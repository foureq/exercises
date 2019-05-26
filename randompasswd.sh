#!/bin/bash
x='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*()_+-={}[]|\:;",./?'
#//所有密码的可能性是26+26+10=62（0-61是62个数字）
pass=''
y=${#x}
for i in {1..16}
do
num=$[RANDOM%y]
tmp=${x:num:1}
pass=${pass}$tmp
done
echo $pass
