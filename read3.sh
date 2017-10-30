#!/bin/bash

read x

while [ ! -z "$x" ]; do
	echo $x
	read x
	
done
