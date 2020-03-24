#!/bin/bash


days=$((RANDOM%100))
for ((i=1;i<=$days;i++))
do
	stake=100
	betAmount=1 
	while [ $stake -gt 50 -a $stake -lt 150  ]
	do
		[ $((RANDOM%2)) -eq 1 ] && stake=$((stake+betAmount)) || stake=$((stake-betAmount))
	done
done
