#!/bin/bash

# read INPUT
# echo ${INPUT}


MMSG="my msg"

#单引号和双引号的区别在于单引号不能识别里面的变量
MSG="it is ${MMSG}"
echo ${MSG}
MSG='it is ${MMSG}'
echo ${MSG}
#将变量设置为只读变量
readonly MSG
# MSG="it is changing"  会出现错误
#删除变量(不能删除只读变量)
name="wxh"
echo $name
unset name
echo $name

#将命令进行赋值
cat ./readme.md
LOOk=$(cat readme.md) 
#$()的命令赋值必须带双引号
echo "$LOOK"   
LOOK=`cat ./readme.md`
echo "$LOOK"
#这样转换会忽略换行
echo $LOOK

#数学计算
a=10
b=5
c=$(($a-$b))
echo $c


#接受参数
echo "para one:$1"
echo "para two:$2"
echo "para three:$3"
function func(){
    echo "name: $1"
    echo "age: $2"
}
func wxh 24


#      $0	当前脚本的文件名。
#      $n（n≥1）	传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是 $1，第二个参数是 $2。
#      $#	传递给脚本或函数的参数个数。
#      $*	传递给脚本或函数的所有参数。
#      $@	传递给脚本或函数的所有参数。当被双引号" "包含时，$@ 与 $* 稍有不同
#      $?	上个命令的退出状态，或函数的返回值，一般成功返回0，失败返回1，但用exit退出时则时退出的值。
#      $$	当前 Shell 进程 ID。对于 Shell 脚本，就是这些脚本所在的进程 ID。
echo "shell name:$0"
echo "para one:$1"
echo "all para:$*"
echo "all para:$@"
echo "all para:"$@""
echo "para num:$#"
echo "pid::$$"
echo "result:$?"

for a in $*
do 
    echo $a
done
for a in $@
do 
    echo $a
done
#带双引号是将所有参数作为一个整体
for a in "$*"
do 
    echo $a
done
#$@则没什么区别
for a in "$@"
do 
    echo $a
done

#字符串
#没有引号修饰不能出现空格
str1=wxh
#单引号不能使用变量
str2='my name is wxh'
str3="my name is ${str1}"
echo $str1
echo $str2
echo $str3
#获取字符串长度
echo ${#str3}
#${string: start :length}	从 string 字符串的左边第 start 个字符开始，向右截取 length 个字符。
#${string: start}	从 string 字符串的左边第 start 个字符开始截取，直到最后。
#${string: 0-start :length}	从 string 字符串的右边第 start 个字符开始，向右截取 length 个字符。
#${string: 0-start}	从 string 字符串的右边第 start 个字符开始截取，直到最后。
#${string#*chars}	从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
#${string##*chars}	从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 右边的所有字符。
#${string%*chars}	从 string 字符串第一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。
#${string%%*chars}	从 string 字符串最后一次出现 *chars 的位置开始，截取 *chars 左边的所有字符。
#字符串截取：从左边第0个开始，截取相应长度的字符串
echo ${str3:3:11}
#字符串截取：从右边第1个开始，截取相应长度的字符串
echo ${str3:0-11:11}

url="http://wxh.net/shell.html"
echo ${url#*:}
echo ${url#*p:}
echo ${url#*http://}
echo ${url#http://}
echo ${url#*/}
echo ${url##*/}

#数组
arr=(20 56 "wxh")
echo ${arr[2]}
#获取所有数组元素
echo ${arr[*]}
echo ${arr[@]}
#获取数组长度
echo ${#arr[*]}
echo ${#arr[@]}
#数组拼接
arr1=(10 40)
arr_new=(${arr[@]} ${arr1[@]})
echo ${arr_new[@]}
#删除元素
unset arr_new[2]
echo ${arr_new[@]}
#关联数组
declare -A color
color["red"]="#ff0000"
color["green"]="#00ff00"
color["blue"]="#0000ff"
#declare -A color=(["red"]="#ff0000", ["green"]="#00ff00", ["blue"]="#0000ff")
echo $(color["green"])
#获取值
echo ${color[@]}
#获取键
echo ${!color[*]}
#获取元素数量
echo ${#color[*]}
#获取所有元素值
for value in ${color[*]}
do
    echo $value
done
echo "****************"
#获取所有元素下标（键）
for key in ${!color[*]}
do
    echo $key
done
echo "****************"
#列出所有键值对
for key in ${!color[@]}
do
    echo "${key} -> ${color[$key]}"
done



#给命令创建别名
alias timestamp=`date +%s`
TIME_b=`timestamp`
sleep 5
TIME_e=`timestamp`
echo $((TIME_e-TIME_b))