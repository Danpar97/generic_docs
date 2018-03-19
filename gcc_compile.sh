#!/bin/bash

# The pwd must be the repository folder for the script to work

set -e    # halt on first error

# use 'g++' as the compiler
CPP='g++'

# be aggressive about warnings and errors
W_FLAGS='-Wall -Wextra -Werror -Wfatal-errors -Wpedantic -pedantic-errors -fdiagnostics-show-location=once -std=c++11'

# Add external libraries
INC_FLAGS= # '-I/usr/include/SDL2'
SDL_FLAGS= # '-lSDL2 -lSDL2main -lSDL2_image'

# get hash of the last commit
HASH=$(git log | head -n1 | cut -d " " -f 2 | cut -c 1-6)

# clear out old binaries files
rm ./binaries/Linux_Binary_*

# compile
$CPP $INC_FLAGS -c ./source/experimental.cpp -o ./source/experimental.o $W_FLAGS
$CPP -o ./binaries/Linux_Binary_$HASH ./source/experimental.o $SDL_FLAGS $W_FLAGS

# clear out old object files
rm ./source/*.o
