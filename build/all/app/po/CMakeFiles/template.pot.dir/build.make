# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake/bin/cmake

# The command to remove a file.
RM = /opt/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/fshahzad/src/ut/circle-message

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fshahzad/src/ut/circle-message/build/all/app

# Utility rule file for template.pot.

# Include any custom commands dependencies for this target.
include po/CMakeFiles/template.pot.dir/compiler_depend.make

# Include the progress variables for this target.
include po/CMakeFiles/template.pot.dir/progress.make

po/CMakeFiles/template.pot:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/fshahzad/src/ut/circle-message/build/all/app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating translation template"
	cd /home/fshahzad/src/ut/circle-message/build/all/app/po && /usr/bin/intltool-extract --update --type=gettext/ini --srcdir=/home/fshahzad/src/ut/circle-message lock-message.desktop.in
	cd /home/fshahzad/src/ut/circle-message/build/all/app/po && /usr/bin/xgettext -o template.pot -D /home/fshahzad/src/ut/circle-message/po -D /home/fshahzad/src/ut/circle-message/build/all/app/po --from-code=UTF-8 --c++ --qt --language=javascript --add-comments=TRANSLATORS --keyword=tr --keyword=tr:1,2 --keyword=ctr:1c,2 --keyword=dctr:2c,3 --keyword=N_ --keyword=_ --keyword=dtr:2 --keyword=dtr:2,3 --keyword=tag --keyword=tag:1c,2 --package-name='lock-message.pybodensee' --sort-by-file ../qml/AboutPage.qml ../qml/Main.qml lock-message.desktop.in.h
	cd /home/fshahzad/src/ut/circle-message/build/all/app/po && /opt/cmake/bin/cmake -E copy template.pot /home/fshahzad/src/ut/circle-message/po

template.pot: po/CMakeFiles/template.pot
template.pot: po/CMakeFiles/template.pot.dir/build.make
.PHONY : template.pot

# Rule to build all files generated by this target.
po/CMakeFiles/template.pot.dir/build: template.pot
.PHONY : po/CMakeFiles/template.pot.dir/build

po/CMakeFiles/template.pot.dir/clean:
	cd /home/fshahzad/src/ut/circle-message/build/all/app/po && $(CMAKE_COMMAND) -P CMakeFiles/template.pot.dir/cmake_clean.cmake
.PHONY : po/CMakeFiles/template.pot.dir/clean

po/CMakeFiles/template.pot.dir/depend:
	cd /home/fshahzad/src/ut/circle-message/build/all/app && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fshahzad/src/ut/circle-message /home/fshahzad/src/ut/circle-message/po /home/fshahzad/src/ut/circle-message/build/all/app /home/fshahzad/src/ut/circle-message/build/all/app/po /home/fshahzad/src/ut/circle-message/build/all/app/po/CMakeFiles/template.pot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : po/CMakeFiles/template.pot.dir/depend
