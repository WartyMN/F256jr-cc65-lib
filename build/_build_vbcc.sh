#!/bin/zsh

#Hey! don't look here. This here, this is sausage factory. Go make your own build script. You have been warned (I've always wanted to say that). 

export CC65=/opt/homebrew/Cellar/cc65/2.19/bin
export PATH=$CC65/bin:$PATH

DEV=~/dev/bbedit-workspace-foenix
PROJECT=$DEV/f256jr_cc65_lib
CONFIG_DIR=$PROJECT/config_cc65

BUILD_DIR=$PROJECT/build

cd $PROJECT

echo "\n**************************\nCC65 compile start...\n**************************\n"

rm -r $BUILD_DIR/*.o

# compile

echo "\n**************************\nCA65 assemble start...\n**************************\n"

cd $BUILD_DIR

# assemble into object files
ca65 crt0.s -o crt0.o
ca65 mainargs.s -o mainargs.o

echo "\n**************************\nLD65 link start...\n**************************\n"

# link files into an executable
ar65 a ../lib/f256jr.lib crt0.o mainargs.o

echo "\n**************************\nCC65 tasks complete\n**************************\n"

echo "\n**************************\nCC65 build script complete\n**************************\n"
