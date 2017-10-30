#!/bin/bash

sleep 2
./childloading.sh $1 | nc -l $1 | ./readchild.sh > add_file

id=$2
read req arg arg1 < add_file

	case "$req" in 
		add) 
			if [ -z "$arg" ] || [ -n "$arg1" ]; then
				outputchild="nok: bad request" 
			else

				outputchild=$(./add_friend.sh "$id" "$arg")
				
				refresh=30
			fi

			;;
		post) 
			if [ -z "$arg1" ]; then
				outputchild="nok: bad request" 
			else
				outputchild=$(./post_messages.sh "$id" "$arg" "$arg1")
				refresh=30
				

			fi

			;;
		home)

			refresh=.5
			;;
		
	esac 

	echo $outputchild $button > childtest_file

	./child-server.sh $refresh | nc -l $1 >/dev/null



	

