#!/bin/bash
sender=$1
receiver=$2
message=$3
if [ $# -lt 3 ]; then
	exit 1
else
	if [ ! -d "$sender" ]; then
		echo "nok: user '$sender' does not exist"
		exit 1		
	else
		if [ ! -d "$receiver" ]; then 
			echo "nok: user '$receiver' does not exist"
			exit 1
		else
			./P.sh "$receiver post lock"
			echo "ok"
			echo "$sender: $message" >> ./"$receiver"/wall
			./V.sh "$receiver post lock" 
		fi
	fi
	



fi
exit 0
