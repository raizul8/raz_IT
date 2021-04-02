#!/bin/bash

# deletes all packages folder from specified dir or curr dir
echo "Enter directory or leave empty for current dir."
read dir

if [[ -z $dir ]]; then
	dir="."
elif [[ ! -d $dir ]]; then
	echo "dir does not exist."
	exit 1
fi

find $dir -name packages |
while read line;do
	rm -r -f $line
done;