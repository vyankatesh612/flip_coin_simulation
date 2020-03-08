#!/bin/bash -x

declare -A Dictionary

function checkCombination()
	{
		NoofFlip=$1
		NoofCoin=$2
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
			Dictionary[$str]=$((${Dictionary[$str]}+1))
		done
		echo ${!Dictionary[@]}
		echo ${Dictionary[@]}

		findPercentage 
	}
 
function findPercentage()
	{
		for key in ${!Dictionary[@]}
		do
			Dictionary[$key]=$(echo "scale=2;${Dictionary[$key]} / $NoofFlip * 100" | bc)
			echo $Dictionary[$key]
		done
		
		sortDict
	}
function sortDict()
	{
		

	}
 
read -p "Do you Want to flip a coin (Y/N) :" option
while [[ $option == "Y" || $option == "y" ]]
do 
	read -p "How many Times you want flip a coin : " NoofTimes
	read -p "Enter no of coin : " coin	
	checkCombination $NoofTimes $coin
	read -p "Do you Want to continue (Y/N) :" option
done
