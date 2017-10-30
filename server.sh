#!/bin/bash
./create.sh &>/dev/null &disown
./add_friend.sh &>/dev/null &disown
./post_messages.sh &>/dev/null &disown
./display_wall.sh &>/dev/null &disown

if [ ! -p server.pipe ]; then
    	mkfifo server.pipe
fi	

trap ctrl_c INT
	function ctrl_c() {
		rm server.pipe
		exit 0
	}
i=0
if [ ! -f portnumbers ]; then
	touch portnumbers
fi

while true; do


./loading.sh | nc -l 8888 | ./read2.sh > received_file


read req id arg arg1 < received_file

if [ ! -z $req ] && [ ! -d $id ]; then
	number=8889
		while true; do
			if grep -q $number portnumbers; then
				number=$((number + 1))				
			else 
				echo "$id $number" >> portnumbers
				echo $number > current_file
				message="Account Created For"
				break
			fi
		done 
	
	
elif  [ ! -z $req ] && [ -d $id ]; then
	grep $id portnumbers | cut -d" " -f2 > current_file
	message="Welcome back,"

	
fi

	case "$req" in 
		create)
			if [ -z "$arg" ]; then
				output=$(./create.sh "$id")
				display=$(./display_wall.sh "$id")

				
			else
				output="nok: bad request"
			fi
			;;
		*)
			output="usage: $req {create|add|post|display}" 
	esac 
	i=$((i + 1))

	if [[ -z "${req// }" ]]; then
		output="<div><b>This is the home page</b></div><div><form><input name='create' value='username'></input><input type='submit' value='Submit'></input></form></div>"
		echo "8888" > current_file
	fi
		read name < current_file

	if [ $name -eq 8888 ]; then
		page=''
	else

		page="<div><h2>$message $id!</h2><form><input name='add' value='username'></input><input type='submit' value='Add'></input></form><form><input name='post' value='friend'><input value='please post with quotes' name='message'></input><input type='submit' value='post'></input></form>

</div><div><h2>wall</h2> $display </div>"
		
	fi
	echo $output $page > test_file

	./exec-server2.sh $name | nc -l 8888 >/dev/null

	./exec-server.sh $name | nc -l $name >/dev/null
	if [ $name -ne 8888 ]; then 
		./child.sh $name $id & >/dev/null &
	fi

	
done

