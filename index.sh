#!/bin/bash

if [ -z "$1" ] ; then
   echo "No path provided. Scanning the current directory."
   DIR="./"
else
   DIR=$1
fi

if [ ! -d $DIR ] ; then
   echo "Specified path does not exist or is not a directory."
fi

for f in $(find $DIR -type f) ; do
    KEY=$(basename $f)
    echo "$KEY $f"
done
