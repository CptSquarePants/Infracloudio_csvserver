#!/usr/bin/env bash
#Purpose - Bash script to generate comma separated values with index and a random number
#Author - ShashanK (https://github.com/CptSquarePants)


if [[ $1 ]] 
then
	for ((i=0; i<$1; i++));
		do
			echo "$i, ${RANDOM:0:3}" >> inputFile;
		done
else
	for ((i=0; i<10; i++));
		do
			echo "$i, ${RANDOM:0:3}" >> inputFile;
		done
fi
