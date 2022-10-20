#!/bin/bash

#数学运算：
#Bash shell 使用let、(())和[] 执行基本的算术操作| 工具expr 和 bc 可以执行高级操作
#let 命令可以直接执行基本的算术操作，当使用let时，变量名之间不需要再添加$
#自加、自减 ++ -- | += -= 简写 |
#[] 与 let命令一样  result=$[ no1 + no2 ]| result=$[ $no1 +5 ] 
# (()) 操作符 result=$(( no1 + 50)) 
#expr 也可用于基本算术 result=`expr 3+4` | result=$(expr $no1 + 5)
#但是这些只能用于整数运算，但不支持浮点数

no1=4;
no2=5;
let result=no1+no2
echo $result

#bc 是一个用于数学运算的高级实用工具，可以执行浮点数运算并使用一些高级函数
#bc 可以接受操作控制前缀，这些前缀之间使用分号分隔

echo "4 * 0.56" | bc
no=54;
result=`echo "$no * 1.5" | bc`
echo $result

#设定小数精度：
echo "scale=2;22/7" | bc
#进制转换：十进制与二进制之间相互转换
no=100
echo "obase=2;$no" |bc
no=1100100
echo "obase=10;ibase=2;$no"|bc
#计算平方以及平方根
echo "sqrt(100)" |bc 
echo "10^10" | bc
