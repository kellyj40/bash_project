#!/bin/bash
id=$1
friend=$2
if [ $# -lt 1 ]; then 
	echo "nok: user 'id' does not exist"
	exit 1
else
	if [ ! -d "$id" ]; then
		echo "nok: user $id does not exist"
		exit 1
	fi

	if [ $# -eq 1 ]; then
		echo "nok: user 'friend' does not exist"
		exit 1
	else 
		if [ ! -d "$friend" ]; then
			echo "nok: user $friend does not exist" 
			exit 1
		fi
	fi

	if grep  " $friend " "$id"/friends >/dev/null; then
		echo "ok: already friends"
		exit 0
	else 
		./P.sh "$id add lock"
		./P.sh "$friend add lock"
		echo " $friend " >> ./"$id"/friends
		echo " $id " >> ./"$friend"/friends
		./V.sh "$id add lock"
		./V.sh "$friend add lock"
	fi
fi
echo "ok"
exit 0
