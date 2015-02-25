#!/bin/bash

#Return the method name at a given line at the given file
#@auther: Xingda Wang
#@date: 25th/Feb/2015
#@param $1 file name
#@param $2 line number

startLine=1									#initial the line from 1
for((i=$2; i>=startLine; i--))							#start from a given line $2
do
	line=$(head -$i $1 | tail -1)						#store a specific line into the string line
	lineArray=(${line})							#store the line into line array
	for word in ${!lineArray[@]};do						#for each line, examine the words
		#echo ${lineArray[word]}
		if [[ ${lineArray[word]} == "public" 				#if a line contain public keyword
				|| ${lineArray[word]} == "private" 		#if a line contain private keyword
				|| ${lineArray[word]} == "protected"} ]];then	#if a line contain protected keyword
			
			if [[ ${lineArray[word+3]} == "("* ]]; then		#common function(void for example), with tracing white space(Scenatio1)
				echo "${lineArray[word+2]}"			#do not need to change the format
				break 3						#stop 3 level of iterate
			elif [[ ${lineArray[word+2]} == "("* ]];then		#constructor, with tracing white space(Scenario2)
				echo "${lineArray[word+1]}"			#do not need to change the format
				break 3						#stop 3 level of iterate
			elif [[ ${lineArray[word+1]} == *"("* ]];then		#constructor, without tracing white space(Scenario3)
				temp=$(echo ${lineArray[word+1]} | fold -w1)	#extract and store every character in the temp array
				for character in $temp;do			#iterate temp array
					if [[ $character != "(" ]];then		#if it is not "("
						printf "$character"		#print every single character without space and enter
					else
						echo ""				#next line
						break 3				#stop 3 level of iterate
					fi
				done
			elif [[ ${lineArray[word+2]} == *"("* ]];then		#common function, without tracing white space(Scenatio4)
				temp=$(echo ${lineArray[word+2]} | fold -w1)	#extract and store every character in the temp array
				for character in $temp;do			#iterate temp array
					if [[ $character != "(" ]];then		#if it is not "("
						printf "$character"		#print every single character without space and enter
					else
						echo ""				#next line
						break 3				#stop 3 level of iterate
					fi
				done
			fi
		fi
	done
	#echo "$i $line"
done < $1
