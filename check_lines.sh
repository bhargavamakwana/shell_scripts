#!/bin/bash
#
# Author: Bhargav Makwana
#
# Date : 05/02/2020
#
# Description : This shell script is made to count the number of lines of code ( excluding comments ).
#               It will recursively for the files in the subfolders and check the code length.
# How to Use : Give the first argument as the directory path. To check for the lines of a specific type
#              of the file, mention the file type as the second argument.
#              For Example, ./check_lines.sh [parent directory path] [py or sh or cpp]


NAMES="$(find $1 -type d)"

let a=0
let num=0

for name in $NAMES;
do
  num=`sed "s/\s*#.*//g; /^$/ d" $name/*.$2 | wc -l`
  echo "$name lines $num"
  a=$(echo $a+$num|bc)

done

echo "Total lines $a"
