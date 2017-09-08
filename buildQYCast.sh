#!/bin/sh
XBUILD="/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild"
PROJECT_ROOT=$(dirname $(pwd -P $0)/${0#\.\/})
PROJECT="$PROJECT_ROOT/QYCast.xcodeproj"
TARGET="QYCast"
PRODUCT="$PROJECT_ROOT/product"
ARCH="Release"

echo $PROJECT_ROOT
echo $PROJECT
#update first
git pull --rebase

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

#all: QYCast.a
#libi386.a:
$XBUILD -project $PROJECT -target $TARGET -sdk iphonesimulator -configuration $ARCH clean build
cp $PROJECT_ROOT/build/$ARCH-iphonesimulator/lib$TARGET.a "./lib_i386.a"

#libArmv7.a:
$XBUILD -project $PROJECT -target $TARGET -sdk iphoneos -arch armv7 -configuration $ARCH clean build
cp $PROJECT_ROOT/build/$ARCH-iphoneos/lib$TARGET.a "./lib_armv7.a"

#libArm64.a:
$XBUILD -project $PROJECT -target $TARGET -sdk iphoneos -arch arm64 -configuration $ARCH clean build
cp $PROJECT_ROOT/build/$ARCH-iphoneos/lib$TARGET.a "./lib_arm64.a"

rm "${PRODUCT}/lib${TARGET}.a"

#libUniversal.a: libi386.a libArmv7.a libArm64.a
lipo -create "./lib_i386.a"  "./lib_armv7.a"  "./lib_arm64.a" -output "${PRODUCT}/lib${TARGET}.a"
rm lib_i386.a
rm lib_armv7.a
rm lib_arm64.a
echo "清理删除完成"
#cp headers 
rm -Rf "$PRODUCT/include"
mkdir -p "$PRODUCT/include"

find $PROJECT_ROOT/build/$ARCH-iphonesimulator/ -iname "*.h" -exec cp {} "$PRODUCT/include" \;

echo "拷贝完成"
