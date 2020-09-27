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


#3#
declare -A doubleDict
for j in {1..100}
do
	val1=$( generateHeadsOrTails $((RANDOM%2)) );
	val2=$( generateHeadsOrTails $((RANDOM%2)) );
	value=$val1$val2;

	if [ "$value" == "HH" ]
	then
		hhCounter=$((hhCounter+1));
	elif [ "$value" == "HT" ]
	then
		htCounter=$((htCounter+1));
	elif [ "$value" == "TH" ]
	then
		thCounter=$((thCounter+1));
	else
		ttCounter=$((ttCounter+1));
	fi

	doubleDict[$j]=$value;
done

hhpercent1=`echo $hhCounter | awk '{print $1/100}'`;
hhpercent2=`echo $hhpercent1 | awk '{print $1*100 }'`;

ttPercent1=`echo $ttCounter | awk '{print $1/100}'`;
ttPercent2=`echo $ttPercent1 | awk '{print $1*100}'`;

thPercent1=`echo $thCounter | awk '{print $1/100}'`;
thPercent2=`echo $thPercent1 | awk '{print $1*100}'`;

htPercent1=`echo $htCounter | awk '{print $1/100}'`;
htPercent2=`echo $htPercent1 | awk '{print $1*100}'`;

echo "Percentage For Double Heads = "$hhpercent2"%";
echo "Percentage For Double Tails = "$ttPercent2"%";
echo "Percentage For HT = "$htPercent2"%";
echo "Percentage for TH = "$thPercent2"%";

echo "${doubleDict[@]}";
