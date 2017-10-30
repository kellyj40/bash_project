#!/bin/bash

read x

while [ ! -z "$x" ]; do
	echo $x | grep GET | cut -d" " -f2 | cut -c 2- | sed -e 's/?//' -e 's/=/ /' -e 's/%20/ /' -e 's/%20/ /' -e  's/%20/ /' -e 's/home//'
	read x
	
done
