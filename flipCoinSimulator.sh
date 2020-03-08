#!/bin/bash -x
echo "WelCome to Flip Coin Simulation"

coinFlip=$((RANDOM%2))
if [ $coinFlip -eq 1 ]
then
	echo "Head"
else
	echo "Tail"
fi

