#!/bin/bash

#This is the java parser which can extract class name and the method name.
#@auther: Xingda Wang
#@date: 25th/Feb/2015

#@param $1 file name
#@param $2 the number of line

startLine=1							#initial the line from 1
for((i=$2; i>=startLine; i--))					#start from a given line $2
do
	line=$(head -$i $1 | tail -1)				#store a specific line into the string line
	lineArray=(${line})					#store the line into line array
	for word in ${!lineArray[@]};do				#for each line, examine the words
#		echo ${lineArray[word]}
		if [[ ${lineArray[word]} == "class" ]];then	#find the class name
			echo ${lineArray[word+1]}
			break 2					#break 2 levels of loop
		fi
	done
#	echo "$i $line"
done < $1
