#!/bin/sh
XBUILD="/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild"
PROJECT_ROOT=$(dirname $(pwd -P $0)/${0#\.\/})
PROJECT="$PROJECT_ROOT/QYCast.xcodeproj"
TARGET="QYCast"
PRODUCT="$PROJECT_ROOT/product"
ARCH="Release"

echo start to make lib ...
#update first
git pull --rebase >shellLog.md

#check input parameters
if [ $# -gt 0 ]; then
	if [ "$1" = "Debug" ]; then
		ARCH="$1"
	elif [ "$1" = "Release" ]; then
		ARCH="$1"
	else
		ARCH="Release"
	fi
fi

mkdir -p "$PRODUCT"

echo make dir product $ARCH>>shellLog.md
#all: QYCast.a
#libi386.a:
echo build i386
$XBUILD -project $PROJECT -target $TARGET -sdk iphonesimulator -configuration $ARCH clean build >> shellLog.md

if [ $? -eq 0 ]; then
	echo 编译i386成功 $ARCH>>shellLog.md
	echo 编译i386成功 $ARCH
else
	echo 编译i386失败 $ARCH>>shellLog.md
	echo 编译i386失败 $ARCH
	exit 1
fi

echo 拷贝lib_i386 
cp $PROJECT_ROOT/build/$ARCH-iphonesimulator/lib$TARGET.a "./lib_i386.a"

#libArmv7.a:
echo build armv7
$XBUILD -project $PROJECT -target $TARGET -sdk iphoneos -arch armv7 -configuration $ARCH clean build >>shellLog.md

if [ $? -eq 0 ]; then
	echo 编译armv7成功 $ARCH>>shellLog.md
	echo 编译armv7成功 $ARCH
else
	echo 编译armv7失败 $ARCH>>shellLog.md
	echo 编译armv7失败 $ARCH
	exit 2 
fi

echo 拷贝lib_armv7 
cp $PROJECT_ROOT/build/$ARCH-iphoneos/lib$TARGET.a "./lib_armv7.a"

#libArm64.a:
echo build arm64
$XBUILD -project $PROJECT -target $TARGET -sdk iphoneos -arch arm64 -configuration $ARCH clean build >>shellLog.md

if [ $? -eq 0 ]; then
	echo 编译arm64成功 $ARCH>>shellLog.md
	echo 编译arm64成功 $ARCH
else
	echo 编译arm64失败 $ARCH>>shellLog.md
	echo 编译arm64失败 $ARCH
	exit 3
fi

echo 拷贝lib_arm64 
cp $PROJECT_ROOT/build/$ARCH-iphoneos/lib$TARGET.a "./lib_arm64.a"

rm "${PRODUCT}/lib${TARGET}.a"

#libUniversal.a: libi386.a libArmv7.a libArm64.a
echo merge i386 arm64 armv7 to libQYCast.a
lipo -create "./lib_i386.a"  "./lib_armv7.a"  "./lib_arm64.a" -output "${PRODUCT}/lib${TARGET}.a" >>shellLog.md

if [ $? -eq 0 ]; then
	echo 合并库成功 $ARCH>>shellLog.md
	echo 合并库成功 $ARCH
else
	echo 合并库失败 $ARCH>>shellLog.md
	echo 合并库失败 $ARCH
	exit 4
fi

rm lib_i386.a
rm lib_armv7.a
rm lib_arm64.a
echo "清理删除中间库完成" $ARCH>>shellLog.md
#cp headers 
rm -Rf "$PRODUCT/include"
mkdir -p "$PRODUCT/include"

find $PROJECT_ROOT/build/$ARCH-iphonesimulator/ -iname "*.h" -exec cp {} "$PRODUCT/include" \;

if [ $? -eq 0 ]; then

	echo "拷贝头文件完成" $ARCH>>shellLog.md

	echo finish making lib success

	exit 0

else
	echo "拷贝头文件失败" $ARCH>>shellLog.md

	echo finish making lib fail

	exit 5
fi

# # 两个参数 第一个是结果 第二个是输出内容
# shellLog.mdCommandResult()
# {
# 	if [ $1 -eq 0 ]; then
# 		echo $2 success
# 	else
# 		echo $2 fail

# 		exit $3
# 	fi
# }
