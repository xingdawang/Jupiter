#!/bin/bash

#This refresher is used for refresh the git log --oneline
#command and stores the log in the log.Xingda.Jupiter folder
#@auther: Xingda Wang
#@date: 19/02/2015

cd ../../src.Xingda.Jupiter									#move to log diretory
tempString=$(ls)										#read current directory file
fileArray=(${tempString})									#separate name by white space (/s)
for i in "${!fileArray[@]}"								#add "!" to indicate content rather than an index number
do												#itrate to check whether a file is a folder
	if [ -d ${fileArray[i]} ];then								#if it is a directory (-d)
		echo "${fileArray[i]}" "is a directory, and move into the this directory now."
			cd ${fileArray[i]}							#move into the project folder
			echo "$PWD"
			git log --oneline > ../../log.Xingda.Jupiter/GithubLog.log
		else
			echo "${fileArray[i]} is not a directory."
	fi
done
cd ../../core.Xingda.Jupiter/				#move back to the core folder
sh LogRecorder.sh "Generate Github log --oneline"	#take down into the operation log
