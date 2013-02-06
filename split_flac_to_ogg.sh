#!/usr/bin/zsh

wd=`pwd`

cd $1

for x (**/*.cue); do 
    cuebreakpoints $x | shntool split -o flac ${x:r}.flac -t "%n-%t";
    mkdir ${x:t:r}_split; 
    mv *.flac ${x:t:r}_split; 
    cuetag.sh $x ${x:t:r}_split/*.flac;
    for x (**/*_split/*.flac) oggenc $x -b 192 -o ${x:r}.ogg
# uhm...this names files (none)-(none).ogg :(    
#oggenc ${x:t:r}_split/*.flac -b 192 -n "%n-%t"
done

cd $wd
