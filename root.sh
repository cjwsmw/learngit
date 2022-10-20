#!/bin/bash

#修改Bash的提示字符串
#cat ~/.bashrc |grep PS1  
#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$'
#也可以使用\e[1;31 彩色输出类似的特定转移序列来设置彩色提示符
#\u 扩展为用户名 | \h 拓展为主机名 | \w 扩展为当前工作目录

#添加环境变量
#export PATH=/opt/myapp/bin:$PATH
#可以为bashrc中添加简化函数
#prepend() { [ -d "$2" ] && eval $1=\"$2':'\$\$1" && export $1; }
# && 运算符： 命令之间实现逻辑与效果 - 只有&& 左边命令返回真 && 右边命令才会执行
# || 运算符： 命令之间实现逻辑或效果 - 只有|| 左边命令返回假 || 右边命令才会执行
# prepend 提供两个参数 变量名 变量参数   
# -d 判断是否为目录 $2   | PATH=/opt/myapp/bin:$PATH | export $1
#eval 1、执行变量替换，类似与C语言的宏替换 2、执行替换后的命令串
#用法 ： prepend PATH /opt/myapp/bin 
#如果变量为空，则会在末尾留下一个: 
#优化：prepend() { [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1 }
#引入了shell参数扩展的形式：${parameter:+expression}
#如果parameter有值且不为空，则使用expression的值
#这样可以在向环境变量中添加新路径时，当且仅当旧值存在，才会增加。



if [ $UID -ne 0 ]; then
  echo Non root user. Please run as root.
else
  echo Root user
fi

