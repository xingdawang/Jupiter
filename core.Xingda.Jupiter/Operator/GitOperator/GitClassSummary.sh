#!/bin/bash

#This is the git class changes summary
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
			cd $i									#enter the target project folder
			tempString=$(tail -n1 ../../log.Xingda.Jupiter/GithubLog.log)		#find the GithubLog.log last line
			tempArray=${tempString}							#store the last line in the tempArray
			counter=0
			proceededArray={}
			for i in $tempArray;do							#extract initial SHA
				proceededArray[$counter]=$i
				((counter++))
			done
			initialSHA=${proceededArray[0]}						#store the initial SHA into the initialSHA
			echo $initialSHA
			cd ../../src.Xingda.Jupiter/						#move into the src folder
			tempString=$(ls)							#read current directory file
			fileArray=${tempString}							#separate name by white space (/s)
			for i in $fileArray;do							#itrate to check whether a file is a folder
				if [ -d $i ];then						#if it is a directory (-d)
					cd $i							#enter the target folder
					git diff --stat --summary $initialSHA.. HEAD		#list the compare result
					#touch ../../log.Xingda.Jupiter/GitClassSummaryLog.log	#create GitClassSummaryLog.log
					git diff --summary --stat $initialSHA.. HEAD >> ../../log.Xingda.Jupiter/GitClassSummaryLog.log #write log
				fi
			done	
		else
			echo "$i is not a directory."
	fi
done
cd ../../core.Xingda.Jupiter/								
sh LogRecorder.sh "Generate whole classes summary and store the result in /GitClassSummaryLog.log"
