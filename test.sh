#!/bin/sh

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