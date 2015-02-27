#!/bin/bash

#This help to remove the whole directory of the working content
#and its related logs
#@auther: Xingda Wang
#@date: 27th/Feb/2015

cd ../src.Xingda.Jupiter/
temp=$(ls)
tempArray=${temp}
for i in $tempArray;do
	if [[ -d $i ]]; then
		rm -rf $i
		bash ../core.Xingda.Jupiter/LogRecorder.sh "$i in src folder has already been deleted"
	fi
done
cd ../log.Xingda.Jupiter/
rm Git*
bash ../core.Xingda.Jupiter/LogRecorder.sh "Git related files in log folder have already been deleted"
