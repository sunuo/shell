#!/bin/sh
echo $0
echo ${0}
t1=123123abc123
echo $t1
sub=${t1#123}
echo $sub
echo $(pwd -P $0)
teset=$(pwd -P $0)/${0#\.\/}
echo $teset

if [ -f test.sh ]; then
	echo exist
fi