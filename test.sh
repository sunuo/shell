#!/bin/sh
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

getClearMd5()
{
	if [ ! -e $1 ]; then
		return 10
	fi
	return 255
}


echo $(md5 $1 | sed 's/.*=//g' |  sed 's/ //g')
getClearMd5 $1
echo $?
exit 0

# projectHeader=./222
# destinationHeader=./111

# echo copy headers
# rm -rf $destinationHeader/*
# cp -r $projectHeader/* $destinationHeader


# exit 0

# if [ $1 ]; then
# 	echo $1
# else
# 	echo SB
# fi



# sed "s/s.version.*=.*/s.version      = \"$1\"/" QYCast.podspec > sb1
# logResult $? 匹配版本号
# changeName sb1 QYCast.podspec
# result=$?
# logResult $result 替换spec文件