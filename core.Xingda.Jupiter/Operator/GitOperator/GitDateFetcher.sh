#!/bin/bash

#This help to return the specif log between the given date

cd ../../../src.Xingda.Jupiter/

temp=$(ls)				#list the whole items in the src folder
tempArray=${temp}			#split the item name in the tempArray
for i in $tempArray;do			#enter the folder
	if [[ -d $i ]]; then
		cd $i
	fi
done

read -p "Which day would you like to start? Format can be: YYYY-MM-DD or X weeks(days) ago: " startDate
read -p "Which day would you like to end? Enter nothing will return the up-to-date date: " endDate
if [[ -z $endDate ]];then
	git log --since="$startDate"
else
	git log --since="$startDate" --until="$endDate"
fi
cd ../../core.Xingda.Jupiter
if [[ -z $endDate ]];then
	bash LogRecorder.sh "Check target log from $startDate to up-to-date one"
else
	bash LogRecorder.sh "Check target log from $startDate to $endDate"
fi
