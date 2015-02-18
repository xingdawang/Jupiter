#!/bin/bash

#Fetch the file system from Github and store it in the
#src folder.
#@author: Xingda Wang
#@time:	18/02/2015

#Fetch file system from a given url
function fetchFile {
	printf "Please enter url: "
	read url
	echo $(git clone $url)
}

#After fetched the file, detect the folder
function detectFolder {
	fetchFile							#run fetchFile function first
	printf "You are in the folder: "
	echo $PWD							#find the current folder
	#DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )		#deprecated
	#echo $DIR							#deprecated

	tempString=$(ls)						#read current directory file
	fileArray=(${tempString})					#separate name by white space (/s)
#	echo ${#fileArray[@]}						#file length
	for i in "${!fileArray[@]}"					#add "!" to indicate content rather than an index
	do								#itrate to check whether a file is a folder
		if [ -d ${fileArray[i]} ];then				#if it is a directory (-d)
			echo "${fileArray[i]}" "is a directory, and will be moved to src directory."
			echo $(mv ${fileArray[i]} ../../src.Xingda.Jupiter)
		else
			echo "${fileArray[i]} is not a directory."
		fi
	done
	
}

#Currently, only two functions are running
detectFolder 								#(embed fetchFile)
#fetchFile
