#!/bin/bash

set -e    # halt on first error

# use 'clang++' as the compiler
CPP=clang++

# be aggressive about warnings and errors
FLAGS="-gline-tables-only -Wall -Wextra -Werror -Wfatal-errors -std=c++11 -pedantic"

# clear out old object files
rm -f ./source/*.o

# compile

$CPP $FLAGS -o ./Binaries/linux_binary main.cpp

