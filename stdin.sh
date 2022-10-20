#!/bin/bash

#文件描述符与重定向
#文件描述符：是与输入和输出流相关联的整数
#stdin、stdout、stderr 
#标准输入、标准输出、标准错误
#0 、1 、2
# >  文本保存到文件
echo "This is a sample text 1" >~/one/text/temp.txt
# >> 文本追加到文件
echo "This is sample text 2" >>~/one/text/temp.txt
cat ~/one/text/temp.txt
#当命令发送错误并退出时，会返回一个非0的退出状态，退出状态可以在特殊变量$?中获得
#2> 将标准错误输出 | 2>&1 将标准错误转换为标准输出，使两个重定向到同一个文件 &>
#stdout作为单数据流，可以被重定向到文件或是通过管道传入其他程序，但是两个无法兼得

#tee命令可以将数据重定向到文件，而且还能提供一份重定向输出作为管道中后续命令的stdin
# command | tee FILE1 FILE2 | otherCommand
#cat a* | tee out.txt | cat -n
#cat -n 为从stdin中接收到的每一行数据前加上行号并将其写入stdout
#cat: a1: Permission denied 并没有在文件内容中，因为 这个信息被发送到了stderr 而tee只能从stdin中读取
#/dev/stdin|/dev/stderr|/dev/stdout这些特殊的设备文件分别对应stdin|stderr|stdout 
#/dev/null 是黑洞 
#重定向操作符(>和>>) 可以将输出发送到文件中，而不是终端。
#> 和 >> 略有差异。>会先清空文件再写入内容  >> 将内容追加到现有文件的尾部
#默认情况下，重定向操作针对的是标准输出。如果需要使用特定的文件描述符，必须将描述符编号置于操作符之前
# >等同于 1> | 对于 >> 来说，>> 等同于 1>>
#从stdin读取输入的命令能以多种方式接受数据。可以用cat和管道来指定文件
#文件重定向到命令 cmd < file 
#cat a2 | grep A  或 grep A < a2 
#重定向脚本内部的文本块
#出现在cat <<EOF>log.txt 与下一个EOF行之间的所有文本行都会被当做stdin数据
cat<<EOF>log.txt
This is a generated file . Do not edit. Changes will be overwritten.
EOF

#自定义文件描述符
#exec 命令创建全新的文件描述符。打开模式有：只读模式、追加写入模式、截断写入模式
#<操作符合将文件读入stdin。>操作符用于截断模式的文件写入(数据在目标文件内容被截断之后写入)。
# >> 操作符用于追加模式的文件写入。文件描述符可以用以上3种模式中的任意一种来创建
#创建一个用于读取文件的文件描述符
`echo this is a test line > input.txt`
`exec 3<input.txt`
`cat<&3`
#如果要再次读取，就不能继续使用文件描述符3了，而是需要exec重新创建

#创建一个用于写入(截断模式)的文件描述符
`exec 4>output.txt`
`exec newline >&4`
`cat output.txt`

#创建一个用于写入（追加模式）的文件描述符
`exec 5>>input.txt`
`echo appended line >&5`
`cat input.txt`

