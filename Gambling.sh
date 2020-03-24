#!/bin/bash


totalWinLoss () {
	total=0
	for i in ${arr[@]}
	do
		total=$((total+i))
	done
	totalStake=$((days*100))
	if [ $total -lt $totalStake ]
	then
		echo "Total loss after 20 days :"$((totalStake-total))
	elif [ $total -gt $totalStake ]
	then
		echo "Total winning after 20 days :"$((total-totalStake))
	else
		echo "No win No loss"
	fi
}

days=20
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


totalWinLoss
