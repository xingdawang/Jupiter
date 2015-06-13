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
	echo "$i $line"
	checkDoubleSlash=0					#check double slash comments, no comments is 1
	slashStarNumber=0					#check /* or */ numbers

	IFS=', ' read -a lineArray <<< $line
	for word in ${!lineArray[@]};do				#for each line, examine the words
		#echo "${lineArray[word]}"
		#echo $slashStarNumber
		regexDoubleSlash='\/\/'
		regexStarSlash='\*\/'
		regexSlashStar='\/\*'
		if [[ "${lineArray[word]:0:2}" == "//" ]];then
			checkDoubleSlash=1
			echo "${lineArray[word]}" "If statement"
			echo $checkDoubleSlash
		elif [[ "${lineArray[word]}" =~ $regexStarSlash ]] || [[ "${lineArray[word]}" =~ $regexSlashStar ]]; then
			((slashStarNumber+=1))
			echo $slashStarNumber "First elif statement"
			echo "${lineArray[word]}"
		elif [ "${lineArray[word]}" == "class" ] && [ $checkDoubleSlash -eq 0 ]; then	#find the class name
			if (( $slashStarNumber % 2 == 0)); then
				echo $slashStarNumber
				echo $checkDoubleSlash "Second elif statement"
				#echo "${lineArray[word+1]}"
				length=${#lineArray[word+1]}	#check if string end with '{'
				#echo $length			#get string length
				if [ "${lineArray[word+1]:5}" == "{" ];then
					echo ${lineArray[word+1]:0:5}
				else
					echo ${lineArray[word+1]}
				fi
				break 3				#break 3 levels of loop
			fi
			checkDoubleSlash=0
			#break 2					#break 2 levels of loop
		fi
	done	
done < $1
