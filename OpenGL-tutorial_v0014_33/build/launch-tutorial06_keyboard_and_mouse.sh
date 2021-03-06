#!/bin/sh
bindir=$(pwd)
cd /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/tutorial06_keyboard_and_mouse/
export LD_LIBRARY_PATH=:$LD_LIBRARY_PATH

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		 -batch -command=$bindir/gdbscript  /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial06_keyboard_and_mouse 
	else
		"/home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial06_keyboard_and_mouse"  
	fi
else
	"/home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial06_keyboard_and_mouse"  
fi
