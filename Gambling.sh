#!/bin/bash


totalWinLoss () {
	no=$1
	totalArray[0]=0
	for ((j=1;j<=$no;j++))
	do
		total=0
		startIndex=("$echo `expr $(((j-1)*20))`")
		count=0
		endIndex=("$echo `expr $((j*20))`")
		for i in ${arr[@]}
		do
			if [ $count -gt $endIndex ]
			then
				break
			elif [ $count -lt $startIndex ]
			then
				count=$((count+1))
				continue
			fi
			total=$((total+i))
			count=$((count+1))
		done
		totalStake=$((20*100))
		totalArray[$j]=`echo " $((total-totalStake)) + ${totalArray[$((j-1))]}" | bc`
		ele=${totalArray[$j]}
		if [[ "${totalArray[$j]}" -gt "0" ]]
		then
			echo "You won in "$((20*j)) "days :" ${totalArray[$j]}
		elif [[ "${totalArray[$j]}" -lt "0" ]]
		then
			echo "You lose in "$((20*j)) "days :" ${totalArray[$j]}
		else
			echo "No win No loss"
		fi
	done
}

days=$((RANDOM%80+21))
arr[0]=0
for ((i=1;i<=$days;i++))
do
	stake=100
	betAmount=1 
	while [ $stake -gt 50 -a $stake -lt 150  ]
	do
		[ $((RANDOM%2)) -eq 1 ] && stake=$((stake+betAmount)) || stake=$((stake-betAmount))
	done
	arr[$i]=$stake
done

noOfTwenty=$((days/20))

totalWinLoss $noOfTwenty

dayCount=1
for i in ${arr[@]}
do
	if [[ "$i" -gt "100" ]]
	then
		echo "You won on day "$dayCount "with profit of" $((i-100))
	else
		echo "You lost on day "$dayCount "with loss of" $i
	fi
	dayCount=$((dayCount+1))
done
