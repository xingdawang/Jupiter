#!/bin/bash

#This is the entrance of the whole programme
#@auther: Xingda Wang
#@date: 26th/Feb/2015
#param $1 the target code language
#param $2 correspondence operation

#basic color with bold type
WhiteText="\033[37m"					#bold white and white have same effect on some platform e.g Ubuntu
BoldRedText="\033[1;31m"				#bold red text
RedText="\033[31m"					#red text
BoldGreenText="\033[1;32m"				#bold green text
GreenText="\033[32m"					#green text
BoldYellowText="\033[1;33m"				#bold yellow text
YellowText="\033[33m"					#yellow text
BoldBlueText="\033[1;34m"				#bold blue text
BlueText="\033[34m"					#blue text
BoldMagentaText="\033[1;35m"				#bold magenta text
MagentaText="\033[35m"					#magenta text
BoldCyanText="\033[1;36m"				#bold cyan text
CyanText="\033[36m"					#cyan text
escapeText="\033[0m"

#Welcome Board
echo -e "$BoldGreenText********************************************************************************$escapeText"
echo
echo -e "			$BlueText Welcome to use Jupiter $escapeText"
echo
echo -e "$BoldYellowText""Jupiter is a data mining tool designed for analysis the version histories of software systems, thus help to improve software quality. $escapeText"
echo
echo -e "$BoldYellowText""Here is the entrance the whole program, and you can manipulate the whole application through this entrance. $escapeText"
echo
echo -e "$BoldYellowText""Only$escapeText""$BoldRedText two$escapeText""$BoldYellowText parameter need to be provived, like the format below: $escapeText"
echo
echo -e "		$BoldGreenText ./OKJupiter java getFile $escapeText""		""$YellowText(case insensitive)$escapeText"
echo
echo -e "$BoldYellowText""For more information see manul please. (e.g. ./OKJupiter java manual) $escapeText"
echo
echo -e "$BoldGreenText********************************************************************************$escapeText"

#record the operation into the log
#cd core.Xingda.Jupiter/								#take the launch information into the record		
#sh LogRecorder.sh "load Jupiter"
#cd ..

#judge the parameters
if [[ -z $1 && -z $2 ]];then							#judge whether the paramters have been entered
	echo -e "$RedText""Please Enter the paramter like the above format: $escapeText"
elif [[ -z $2 ]];then								#if the second parameter is missing, remind the user
	echo -e "$RedText""Missing the second parameter. $escapeText"
fi

#take command from the user
if [[ $1 && $2 ]];then								#if both parameter is entered
	
	#JAVA									#Java related
	temp1=$1								#${temp1,,} can change all $1 characters into lower case
	if [[ ${temp1,,} == "java" ]];then		
		temp2=$2
		if [[ ${temp2,,} == "getfile" ]];then				#get file from github (GithubEngine.sh)
			#echo $PWD
			cd core.Xingda.Jupiter/CloudEngine
			#ls
			sh GithubEngine.sh
		elif [[ ${temp2,,} == "generategitlog" ]];then			#generate githublog (GitRefresher.sh)
			cd core.Xingda.Jupiter/Refresher
			sh GitLogRefresher.sh "oneline"
		elif [[ ${temp2,,} == "onelinelog" ]];then			#get oneline log (GithubLog.log)
			cd log.Xingda.Jupiter
			xdg-open GithubLog.log
		elif [[ ${temp2,,} == "detailslog" ]];then			#get details log (GithubLogDetails.log)
			cd log.Xingda.Jupiter
			xdg-open GithubLogDetails.log
		elif [[ ${temp2,,} == "operationlog" ]];then			#get operation log (OperationLog.log)
			cd log.Xingda.Jupiter
			xdg-open OperationLog.log
		elif [[ ${temp2,,} == "manualcompare" ]];then			#compare two SHAs manully (GitDiffComparer.sh)
			cd core.Xingda.Jupiter/Operator/GitOperator
			sh GitDiffComparer.sh
		elif [[ ${temp2,,} == "classsummary" ]];then			#feedback of all classes compare result (GitClassComparer.sh)
			cd core.Xingda.Jupiter/Operator/GitOperator/
			bash GitClassSummary.sh
		else
			echo -e "$MagentaText""Do not find the second parameter command, please refer to the mannul.$escapeText"			
		fi

	#Add further language here	
	#elif [[ $1 -eq "future_language" ]];then
	#	do something

	else
		echo -e "$MagentaText""Do not support the input programming language $escapeText"
	fi
fi

