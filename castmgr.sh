#!/bin/sh
projectPath=./plugin/QYCast
projectProduct=./plugin/QYCast/product/libQYCast.a
projectCommand=$projectPath/buildQYCast.sh

destination=/Users/xukaitian1/Documents/Work/Git/libs/QYCast
destinationDebug=$destination/Debug
destinationRelease=$destination/Release

echo before md5 debug $(md5 $destinationDebug/libQYCast.a)
echo before md5 release $(md5 $destinationRelease/libQYCast.a)

if [ $1 ]; then
	podversion=$1
else
	echo 请输入版本号
	exit 1
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

echo 更新最新的lib代码
cd destination
git stash save
git pull --rebase
echo 更新最新的lib代码完毕

if [ -e  $projectCommand ]; then
	echo begin release .................
	sh $projectCommand Release
	if [ $? -eq 0 ]; then
		cp $projectProduct $destinationRelease
		echo end release .................

		echo begin Debug .................
		sh $projectCommand Debug
		if [ $? -eq 0 ]; then
			cp $projectProduct $destinationDebug
			echo end Debug .................

			echo update QYCastPod
			echo after md5 debug $(md5 $destinationDebug/libQYCast.a)
			echo after md5 release $(md5 $destinationRelease/libQYCast.a)

			# 更新版本号
			if [ -e QYCast_debug.podspec ]; then

				sed "s/s.version.*=.*/s.version      = \"$podversion\"/" QYCast_debug.podspec > sb1
				logResult $? 匹配版本号
				changeName sb1 QYCast_debug.podspec
				result=$?
				logResult $result 替换QYCast_debug spec文件

			else
				echo 找不到Debug版本管理文件
			fi

			if [ -e QYCast.podspec ]; then

				sed "s/s.version.*=.*/s.version      = \"$podversion\"/" QYCast.podspec > sb2
				logResult $? 匹配版本号
				changeName sb1 QYCast.podspec
				result=$?
				logResult $result 替换QYCast spec文件
	
			else
				echo 找不到Release版本管理文件
			fi
			# add commit
			echo $(git status)
			git add -A
			git commit -a -m "更新qycast 到 $podversion"
			git push origin HEAD:refs/for/master
			git tag -am "$podversion" $podversion
			git push origin --tags
			pod repo push qyspec

		else
			echo debug failed
		fi
	else
		echo release failed
	fi
else
	echo 打包文件不存在 请检查路径	
fi