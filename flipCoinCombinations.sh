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

#2#

declare -A singletDict
hCounter=0;
tCounter=0;

hhCounter=0;
ttCounter=0;
thCounter=0;
htCounter=0;

function generateHeadsOrTails(){
	case $1 in
		1)randomValue="T";;
		*)randomValue="H";;
	esac
	echo $randomValue;
}
for i in {1..100}
do
	randomValueGenerated=$( generateHeadsOrTails $((RANDOM%2)) );
	echo $randomValueGenerated;
	if [ "$randomValueGenerated" == "H" ]
	then
		hCounter=$((hCounter+1));
	else
		tCounter=$((tCounter+1));
	fi

	singletDict[$i]=$randomValueGenerated;
done

headpercent1=`echo $hCounter | awk '{print $1/100}'`;
headpercent2=`echo $headpercent1 | awk '{print $1*100 }'`;

tailPercent1=`echo $tCounter | awk '{print $1/100}'`;
tailPercent2=`echo $tailPercent1 | awk '{print $1*100}'`;

echo "Percentage For Heads = "$headpercent2"%";
echo "Percentage For Tails = "$tailPercent2"%";
echo "${singletDict[@]}";



