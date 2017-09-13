#!/bin/sh
str1='34'
str2='12'
str3=$str1$str2
echo $str3
ls 
if [ $? -eq 0 ]; then
	echo 编译i386成功 
else
	echo 编译i386失败 
	exit 1
fi

if [ -e SHLL.sh ]
then
	echo YES
else
	echo NO
fi

fruit="banana"
case $fruit in
	"banana" ) echo bbb
		;;
	"apple" ) echo app
		;;
esac

# until [ 2 == 1 ];
# do
# 	echo 1
# done

hello()
{
	tt=4
	echo hello $1 $0
}	

hello "sb" 
hello $1 $2