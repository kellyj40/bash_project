#!/bin/bash

id="$1"
if [ $# -lt 1 ]; then
	echo "nok: no identifier provided"
	exit 1
else
	if [ ! -d $id ]; then
		./P.sh "$id lock"
		mkdir $id
		touch ./$id/wall
		touch ./$id/friends
		echo "ok: user created!"
		./V.sh "$id lock"
	else 
		echo "nok: user already exists"
		exit 1
	fi
fi
exit 0
