#!/bin/sh
bindir=$(pwd)
cd /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/tutorial05_textured_cube/
export LD_LIBRARY_PATH=:$LD_LIBRARY_PATH

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		 -batch -command=$bindir/gdbscript  /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial05_textured_cube 
	else
		"/home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial05_textured_cube"  
	fi
else
	"/home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial05_textured_cube"  
fi
