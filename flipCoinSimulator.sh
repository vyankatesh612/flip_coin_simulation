#!/bin/bash -x

declare -A singletDict

function singlet()
	{
		NoofFlip=$1
		singletDict[H]=0
      singletDict[T]=0
		coin=1
		for (( i=0;i<$NoofFlip;i++ ))
		do
			for (( j=0;j<$coin;j++ ))
			do
	      	str=" "
					CoinFlip=$((RANDOM%2))
						if [ $CoinFlip -eq 1 ]
                  then
                  	str="H"
                  else
                  	str="T"
                  fi
			done
	singletDict[$str]=$((${singletDict[$str]}+1))
	done
	
	findPercentage
	}
 
function findPercentage()
	{
		for key in ${!singletDict[@]}
		do
			singletDict[$key]=$((${singletDict[$key]}*100/$NoofFlip))
		done
	}
 
read -p "Do you Want to flip a coin (Y/N) :" option
if [[ $option == "Y" || $option == "y" ]]
then 
	read -p "How many Times you want flip a coin : " NoofTimes
	singlet $NoofTimes
fi
