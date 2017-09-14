#!/bin/sh

changeName()
{
	if [ -e $1 ] && [ -e $2 ]; then
		echo 条件满足 '$1='$1 '$2='$2

		mv -f $1 $2

	else
		echo 条件不满足 '$1='$1 '$2='$2
	fi
}

changeName $1 $2