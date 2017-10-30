#!/bin/bash
id=$1
if [ $# -ne 1 ]; then
	exit 1
else
	if [ ! -d "$id" ]; then
		echo "user '$id' does not exist"
		exit 1
	else
		echo "start_of_file"
		echo "$(cat ./$id/wall)"
		echo "end_of_file"
	fi
fi
exit 0
