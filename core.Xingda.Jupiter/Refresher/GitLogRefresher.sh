#!/bin/bash

#This refresher is used for refresh the git log --oneline
#command and stores the log in the log.Xingda.Jupiter folder
#@auther: Xingda Wang
#@date: 19/02/2015

cd ../../log.Xingda.Jupiter				#move to log diretory
git log --oneline > GithubLog.log			#generate git log --oneline command
cd ../core.Xingda.Jupiter/				#move back to the core folder
sh LogRecorder.sh "Generate Github log --oneline"	#take down into the operation log
