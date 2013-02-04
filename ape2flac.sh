#!/usr/bin/zsh

#first argument is input directory
#second (hopefully last) is output directory

for x ($1/*.ape) ffmpeg -i $x $2${x:t:r}.flac
