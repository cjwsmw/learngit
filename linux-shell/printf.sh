#!/bin/bash

#%s | %c | %d | %f 均为格式替换符
#%-5s 格式为左对齐且宽度为5的字符串替换（- 表示左对齐）
#浮点数 可以使用其他参数对小数部分进行舍入
#对于Mark字段 %-4.2f .2 指定保留两位小数
#env|printenv 查看当前shell中所定义的全部环境变量
#cat /proc/$PID/environ 查看进程环境变量
#environ 文件 间隔符为\0  可更换为\n 
#cat /proc/985/environ | tr '\0' '\n' 比较易读
#pgrep ssh 获取相关进程的进程ID
#在变量名之前加上美元符号($) 可以访问变量内容
# echo $var | echo ${var} 
#获取字符串长度 length=${#var} 
#获取当前使用的shell  echo $SHELL | echo $0

#打印彩色输出：
#文本颜色色码：重置=0|黑色=30|红色=31|绿色=32|黄色=33|蓝色=34|洋红=35|青色=36|白色=37
#echo -e "\e[1;31m This is red text \e[0m"


printf "%-5s %-10s %-4s\n" No Name Mark
printf "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456
printf "%-5s %-10s %-4.2f\n" 2 James 90.9989
printf "%-5s %-10s %-4.2f\n" 3 Jeff 77.564
