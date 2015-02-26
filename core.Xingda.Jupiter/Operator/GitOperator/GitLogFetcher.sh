#!/bin/bash

#This is the git log fetcher, and it helps to display the log
#whether it in oneline version or detailed version
#@auther: Xingda Wang
#@date: 26/02/2015

echo "If you see '-bash: XXX: command not found', please open the log as txt format manully, the location is ~/Jupiter/log.Xingda.Jupiter/"
cat << EOF
	Type "GitLogFetcher.sh oneline" to see the oneline version
	Type "GitLogFetcher.sh details" to see the details version
EOF

if [[ $1 == "oneline" ]];then
	xdg-open ../../../log.Xingda.Jupiter/GithubLog.log				#open the Github.log using system default tool
	cd ../../
	sh LogRecorder.sh "Open GithubLog.log"						#record operation log	
elif [[ $1 == "details" ]]; then
	xdg-open ../../../log.Xingda.Jupiter/GithubLogDetails.log
	cd ../../
	sh LogRecorder.sh "Open GithubLogDetails.log"
else
	echo "Invalid input, need or more than one parameter"
	cd ../../
	sh LogRecorder.sh "Fail to fetch the log due to invalid input or no open tool"
fi
