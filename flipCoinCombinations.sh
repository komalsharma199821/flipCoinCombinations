#!/bin/bash -x

#1#
randomValue=$((RANDOM%2));
echo $randomValue;
if [ $randomValue == 1 ]
then
	echo "Its Heads!!";
else
	echo "Its Tails!!";
fi
