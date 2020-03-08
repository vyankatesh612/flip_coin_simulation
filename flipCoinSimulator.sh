#!/bin/bash -x

declare -A doubletDict

function doublet()
	{
		NoofFlip=$1
		NoofCoin=2
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
	doubletDict[$str]=$((${doubletDict[$str]}+1))
	done
	findPercentage 
	}
 
function findPercentage()
	{
		for key in ${!doubletDict[@]}
		do
			doubletDict[$key]=$(echo " ${doubletDict[$key]}/$NoofFlip*100" | bc )
		done
	}
 
read -p "Do you Want to flip a coin (Y/N) :" option
if [[ $option == "Y" || $option == "y" ]]
then 
	read -p "How many Times you want flip a coin : " NoofTimes
	doublet $NoofTimes
fi
