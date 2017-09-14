#!/bin/sh
cd /Users/xukaitian1/Documents/Work/Git/GITHUB/Shells/dirtt

pwd

exit 0

if [ $1 ]; then
	echo $1
else
	echo SB
fi

logResult()
{
	if [ $1 -eq 0 ]; then
		echo $2 success
	else
		echo $2 failed
	fi	
}

changeName()
{
	if [ -e $1 ] && [ -e $2 ]; then
		mv -f $1 $2
		return $?
	else
		return 0
	fi
}

sed "s/s.version.*=.*/s.version      = \"$1\"/" QYCast.podspec > sb1
logResult $? 匹配版本号
changeName sb1 QYCast.podspec
result=$?
logResult $result 替换spec文件