#!/bin/bash
for i in `ls *.$1`
do
    mv $i  ${i%.*}.$2   #字符串去尾 ${变量名%关键词*}
done
