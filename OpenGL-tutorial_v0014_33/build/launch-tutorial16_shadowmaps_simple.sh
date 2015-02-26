#!/bin/sh
bindir=$(pwd)
cd /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/tutorial16_shadowmaps/
export LD_LIBRARY_PATH=:$LD_LIBRARY_PATH

if test "x$1" = "x--debugger"; then
	shift
	if test "x" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		 -batch -command=$bindir/gdbscript  /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial16_shadowmaps_simple 
	else
		"/home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial16_shadowmaps_simple"  
	fi
else
	"/home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/tutorial16_shadowmaps_simple"  
fi