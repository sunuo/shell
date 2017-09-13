#!/bin/sh
projectPath=./plugin/QYCast
projectProduct=./plugin/QYCast/product/libQYCast.a
projectCommand=$projectPath/buildQYCast.sh

destination=/Users/xukaitian1/Documents/Work/Git/libs/QYCast
destinationDebug=$destination/Debug
destinationRelease=$destination/Release

if [ -e  $projectCommand ]; then
	echo begin release .................
	sh projectCommand Release
	if [ $? -eq 0 ]; then
		cp debugProduct $destinationRelease
		echo end release .................

		echo begin Debug .................
		sh projectCommand Debug
		if [ $? -eq 0 ]; then
			cp debugProduct $destinationDebug
			echo end Debug .................

			echo update QYCastPod
			cd destination
			# 更新版本号
			if [ -e QYCast_debug.podspec ]; then

			else
				echo 找不到Debug版本管理文件
			fi

			if [ -e QYCast.podspec ]; then
				
			else
				echo 找不到Release版本管理文件
			fi
			# add commit
			git add -A 
			# tag
			# push

		else
			echo debug failed
		fi
	else
		echo release failed
	fi
else
	echo 打包文件不存在 请检查路径	
fi