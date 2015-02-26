#!/bin/bash

#This help implement the git diff command
#@auther: Xingda Wang
#@date: 26th/Feb/2015

cd ../../..											#move back to the Jupiter folder
cd src.Xingda.Jupiter/										#move into target folder
tempString=$(ls)										#read current directory file
fileArray=${tempString}										#separate name by white space (/s)
for i in $fileArray										
do												#itrate to check whether a file is a folder
	if [ -d $i ];then									#if it is a directory (-d)
		echo "$i" "is the target directory"
			cd $i
			read -p "Please enter the 1st SHA-1:" startSHA
			read -p "Please enter the 2nd SHA-2:" endSHA
			git diff $startSHA..$endSHA
		else
			echo "$i is not a directory."
	fi
done
