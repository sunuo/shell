#!/bin/sh

echo $(pwd)
echo $(pwd -P)
echo $(cd $(dirname $0);pwd)

baseDirForScriptSelf=$(cd "$(dirname "$0")"; pwd)
echo "full path to currently executed script is : ${baseDirForScriptSelf}"

exit 0

cd $1
# for file  in  $(ls | grep $2); do
for file  in  $(ls); do	
	 if [[ -f $file ]]; then
	 	echo $file
	 	 (echo '0a'; echo '#if kIsMyProject'; echo '.'; echo 'wq') | ed -s $file
	 	 (echo '$a'; echo '#endif'; echo '.'; echo 'wq') | ed -s $file
	 fi
done

exit 0


echo $*
echo $@

for i in "$*"; do
	echo $i
done

echo ...............
for i in "$@"; do
	echo $i
done

# echo $params;
exit 0
oar=$(echo $*)

if [ $testp ]; then
	echo 1111
fi

logResult()
{
	if [ $1 -eq 0 ]; then
		echo $2 success
	else
		echo $2 failed
	fi	
	echo $testp
	testp=sb
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

cd ./prj
./prj.sh
exit 0

# if [ "$(echo 123|grep '4')" ];then
# 	echo exist
# else
# 	echo not exist
# fi

# exit 0
logResult $? test
echo $testp
exit 0

params=$(echo $*)
if [ $params ];then

	 if [ $(echo $params|grep 'h') ] ; then
	 	echo 只更新头文件 自动迭代版本号

	 elif [ $(echo $params|grep 'b') ] ; then
	 	echo 只更新基线podfile到最新版本号

	 elif [ $(echo $1|grep -E -o '[0-9]+.[0-9]+.[0-9]+.[1-9][0-9]*') ]; then
	 	echo 版本号格式正常	 	#statements
	 else
	 	 echo 版本号格式有误
	 	 exit 1
	 fi
else
	echo 没有参数 自动迭代版本号
fi

exit 0

echo $params

echo "print each param from \$*"
for var in $*
do
    echo "$var"
done

echo "print each param from \$@"
for var in $@
do
    echo "$var"
done

exit 0
    

currentVersion=$(cat QYCast.podspec|sed -n 's/.*s.version.*=//p'|sed 's/"//g'|sed 's/ //g')
lastVersionNumber=$(echo "$currentVersion"|grep -o '[1-9][0-9]*$')
((lastVersionNumber=$lastVersionNumber+1))
echo lastVersion $currentVersion $lastVersionNumber
currentVersion=$(echo $currentVersion|sed "s/[1-9][0-9]*$/$lastVersionNumber/")
echo currentVersion $currentVersion

cat Podfile|sed "s/.*QYCast'.*/    pod 'QYCast', '$currentVersion', :configurations => ['Release']/"|sed "s/.*QYCast_debug'.*/    pod 'QYCast_debug', '$currentVersion', :configurations => ['Debug']/">temppod
changeName temppod Podfile

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