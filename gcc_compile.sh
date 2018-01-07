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

# clear out old object files
rm ./source/*.o

# compile
$CPP $INC_FLAGS -c ./source/experimental.cpp -o ./source/experimental.o $W_FLAGS
$CPP -o ./binaries/experimental_Linux ./source/experimental.o $SDL_FLAGS $W_FLAGS

# (outdated method) compile from terminal: g++ -o experimental ./experimental.cpp $(pkg-config --cflags --libs SDL2 SDL2main SDL2_image)

# Two step compilation
# g++  -I/usr/include/SDL2 -c ./source/experimental.cpp -o ./source/experimental.o
# g++  -o ./source/experimental ./source/experimental.o  -lSDL2 -lSDL2main -lSDL2_image
