#!/bin/bash
sum=$(who | wc -l)
[ $sum -ge 3 ] && echo "$sum登录" | mail -s 'waringgg' root
