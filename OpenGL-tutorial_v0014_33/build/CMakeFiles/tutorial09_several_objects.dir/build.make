# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/cmake-gui

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build

# Include any dependencies generated for this target.
include CMakeFiles/tutorial09_several_objects.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/tutorial09_several_objects.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tutorial09_several_objects.dir/flags.make

CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o: CMakeFiles/tutorial09_several_objects.dir/flags.make
CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o: ../tutorial09_vbo_indexing/tutorial09_several_objects.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o -c /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/tutorial09_vbo_indexing/tutorial09_several_objects.cpp

CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/tutorial09_vbo_indexing/tutorial09_several_objects.cpp > CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.i

CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/tutorial09_vbo_indexing/tutorial09_several_objects.cpp -o CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.s

CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.requires:
.PHONY : CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.requires

CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.provides: CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial09_several_objects.dir/build.make CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.provides

CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.provides.build: CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o

CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o: CMakeFiles/tutorial09_several_objects.dir/flags.make
CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o: ../common/shader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o -c /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/shader.cpp

CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/shader.cpp > CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.i

CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/shader.cpp -o CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.s

CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.requires:
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.requires

CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.provides: CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial09_several_objects.dir/build.make CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.provides

CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.provides.build: CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o

CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o: CMakeFiles/tutorial09_several_objects.dir/flags.make
CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o: ../common/controls.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o -c /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/controls.cpp

CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/controls.cpp > CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.i

CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/controls.cpp -o CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.s

CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.requires:
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.requires

CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.provides: CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial09_several_objects.dir/build.make CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.provides

CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.provides.build: CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o

CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o: CMakeFiles/tutorial09_several_objects.dir/flags.make
CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o: ../common/texture.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o -c /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/texture.cpp

CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/texture.cpp > CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.i

CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/texture.cpp -o CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.s

CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.requires:
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.requires

CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.provides: CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial09_several_objects.dir/build.make CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.provides

CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.provides.build: CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o

CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o: CMakeFiles/tutorial09_several_objects.dir/flags.make
CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o: ../common/objloader.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o -c /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/objloader.cpp

CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/objloader.cpp > CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.i

CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/objloader.cpp -o CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.s

CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.requires:
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.requires

CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.provides: CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial09_several_objects.dir/build.make CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.provides

CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.provides.build: CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o

CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o: CMakeFiles/tutorial09_several_objects.dir/flags.make
CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o: ../common/vboindexer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o -c /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/vboindexer.cpp

CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/vboindexer.cpp > CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.i

CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/common/vboindexer.cpp -o CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.s

CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.requires:
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.requires

CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.provides: CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.requires
	$(MAKE) -f CMakeFiles/tutorial09_several_objects.dir/build.make CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.provides.build
.PHONY : CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.provides

CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.provides.build: CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o

# Object files for target tutorial09_several_objects
tutorial09_several_objects_OBJECTS = \
"CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o" \
"CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o" \
"CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o" \
"CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o" \
"CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o" \
"CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o"

# External object files for target tutorial09_several_objects
tutorial09_several_objects_EXTERNAL_OBJECTS =

tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o
tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o
tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o
tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o
tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o
tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o
tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/build.make
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libGLU.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libGL.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libSM.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libICE.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libX11.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libXext.so
tutorial09_several_objects: external/glfw-3.0.3/src/libglfw3.a
tutorial09_several_objects: external/libGLEW_190.a
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libGLU.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libXrandr.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libXi.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libXxf86vm.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/librt.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libm.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libGL.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libSM.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libICE.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libX11.so
tutorial09_several_objects: /usr/lib/x86_64-linux-gnu/libXext.so
tutorial09_several_objects: CMakeFiles/tutorial09_several_objects.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable tutorial09_several_objects"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tutorial09_several_objects.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -E copy /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/./tutorial09_several_objects /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/tutorial09_vbo_indexing/

# Rule to build all files generated by this target.
CMakeFiles/tutorial09_several_objects.dir/build: tutorial09_several_objects
.PHONY : CMakeFiles/tutorial09_several_objects.dir/build

CMakeFiles/tutorial09_several_objects.dir/requires: CMakeFiles/tutorial09_several_objects.dir/tutorial09_vbo_indexing/tutorial09_several_objects.cpp.o.requires
CMakeFiles/tutorial09_several_objects.dir/requires: CMakeFiles/tutorial09_several_objects.dir/common/shader.cpp.o.requires
CMakeFiles/tutorial09_several_objects.dir/requires: CMakeFiles/tutorial09_several_objects.dir/common/controls.cpp.o.requires
CMakeFiles/tutorial09_several_objects.dir/requires: CMakeFiles/tutorial09_several_objects.dir/common/texture.cpp.o.requires
CMakeFiles/tutorial09_several_objects.dir/requires: CMakeFiles/tutorial09_several_objects.dir/common/objloader.cpp.o.requires
CMakeFiles/tutorial09_several_objects.dir/requires: CMakeFiles/tutorial09_several_objects.dir/common/vboindexer.cpp.o.requires
.PHONY : CMakeFiles/tutorial09_several_objects.dir/requires

CMakeFiles/tutorial09_several_objects.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tutorial09_several_objects.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tutorial09_several_objects.dir/clean

CMakeFiles/tutorial09_several_objects.dir/depend:
	cd /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33 /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33 /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build /home/thijs/codes/BSshadow/OpenGL-tutorial_v0014_33/build/CMakeFiles/tutorial09_several_objects.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tutorial09_several_objects.dir/depend

