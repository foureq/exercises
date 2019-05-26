#!/bin/bash
#for i in {1..20}
for i in `seq 20`
do
    [ $[i%6] -ne 0 ]  &&  continue  #条件成立就从头开始循环,退出当前进行下一次.
    echo $[i*i]
done
