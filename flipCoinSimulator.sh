#!/bin/bash -x

declare -A tripletDict

function triplet()
	{
		NoofFlip=$1
		NoofCoin=3
		for (( i=0;i<$NoofFlip;i++ ))
		do
			str=" "
			for (( j=0;j<$NoofCoin;j++ ))
			do
				CoinFlip=$((RANDOM%2))
				if [ $CoinFlip -eq 1 ]
				then
					str+="H"
				else
					str+="T"
				fi
			done
			tripletDict[$str]=$((${tripletDict[$str]}+1))
		done
		echo ${!tripletDict[@]}
		echo ${tripletDict[@]}
		findPercentage 
	}
 
function findPercentage()
	{
		for key in ${!tripletDict[@]}
		do
			tripletDict[$key]=$(echo "scale=2;${tripletDict[$key]} / $NoofFlip * 100" | bc)
		done
	}
 
read -p "Do you Want to flip a coin (Y/N) :" option
if [[ $option == "Y" || $option == "y" ]]
then 
	read -p "How many Times you want flip a coin : " NoofTimes
	triplet $NoofTimes
fi
