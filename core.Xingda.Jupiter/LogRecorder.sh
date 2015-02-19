#!/bin/bash

#Record each operations in the log.Xingda.Jupiter/Log.log
#as text format
#@author: Xingda Wang
#time: 19/02/2015

#Writing record into the log file
#@parameter $1 operation
cd ../log.Xingda.Jupiter
currentPath=$(pwd)					#move to log.Xingda.Jupiter directory
touch log.log						#setup log, if it exists, no bother
temp=$(date +"%m/%d/%Y-%H:%M:%S")" "$USER" "$1		#format as mm/dd/yyyy-hh:mm:ss user operation
echo $temp | cat - log.log > temp && mv temp log.log	#can be improved here

