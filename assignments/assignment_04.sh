#!/usr/bin/env bash

#Download the Text of Guilliver's Travels from Guterberg Project

guillivers_book=$(curl https://www.gutenberg.org/files/829/829-0.txt)
book_lines=$(echo $guillivers_book | wc -c)

one_fifth=$(( $book_lines/5 ))

END=15
count=0
for ((i=3;i<=END;i++)); do
	not_prime=0
	for((k=2; k<=$i/2; k++))
	do
	  ans=$(( i%k ))
	  if [ $ans -eq 0 ]
	  then
		not_prime=1
		break
	  fi
	done	
	if [ $not_prime -eq 0 ]
	then
		mkdir $i
		cut_pos=$(( count*one_fifth ))
		count=$(( count+1 ))
		echo ${guillivers_book:cut_pos:one_fifth} > $i/g_book.$count
		
	fi
done
