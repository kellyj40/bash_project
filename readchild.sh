#!/bin/bash

read x

while [ ! -z "$x" ]; do
	echo $x | grep GET | cut -d" " -f2 | cut -c 2- | sed -e 's/?//g' -e 's/=/ /g' -e 's/%20/ /g' -e 's/%20/ /' -e  's/%20/ /' -e 's/&message/ /g' -e 's/%22/ /g' -e 's/%22/ /g' -e 's/+/ /g'
	read x
	
done
