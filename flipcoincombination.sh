IS_HEAD=0
IS_TAILS=1
plays=0

declare -A coin
randomNumber=0
randomNumber2=0
randomNumber3=0
coin[HH]=0
coin[TT]=0
coin[HT]=0
coin[TH]=0
coin[T]=0
coin[H]=0
coin[HHH]=0
coin[HHT]=0
coin[HTT]=0
coin[TTT]=0
coin[THH]=0
coin[TTH]=0
coin[THT]=0
coin[HTH]=0
printf "Enter How many times you want to flip the coin:\n"
read plays


for (( index=1; index<=$plays; index++ ))
do
	randomNumber=$(( RANDOM % 2 ))

   if [ $randomNumber -eq $IS_HEAD ]
      then
         coin[H]=$(( "${coin[H]}" + 1 ))
      else
         coin[T]=$(( "${coin[T]}" + 1 ))
fi
done



for (( index=1; index<=$plays*2; index++ ))
do
   randomNumber=$(( RANDOM % 2 ))
	randomNumber2=$(( RANDOM % 2 ))
   if [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_HEAD ]
   	then
      	coin[HH]=$(( "${coin[HH]}" + 1 ))
      elif [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_TAILS ]
      then
			coin[HT]=$(( "${coin[HT]}" + 1 ))
		elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_HEAD ]
		then
			coin[TH]=$(( "${coin[TH]}" + 1 ))
		elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_TAILS ]
		then
			coin[TT]=$(( "${coin[TT]}" + 1 ))
	fi
done



for (( index=0; index<=$plays*3; index++ ))
do
	randomNumber=$(( RANDOM % 2 ))
   randomNumber2=$(( RANDOM % 2 ))
	randomNumber3=$(( RANDOM % 2 ))
	if [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_HEAD -a $randomNumber3 -eq $IS_HEAD ]
		then
			coin[HHH]=$(( "${coin[HHH]}" + 1 ))
		elif [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_HEAD -a $randomNumber3 -eq $IS_TAILS ]
		then
			coin[HHT]=$(( "${coin[HHT]}" + 1 ))
		elif [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_TAILS -a $randomNumber3 -eq $IS_TAILS ]
      then
			  coin[HTT]=$(( "${coin[HTT]}" + 1 ))
		elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_TAILS -a $randomNumber3 -eq $IS_TAILS ]
      then
			   coin[TTT]=$(( "${coin[TTT]}" + 1 ))
		elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_HEAD -a $randomNumber3 -eq $IS_HEAD ]
      then
				coin[THH]=$(( "${coin[THH]}" + 1 ))
		elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_TAILS -a $randomNumber3 -eq $IS_HEAD ]
      then
				coin[TTH]=$(( "${coin[THH]}" + 1 ))
		elif [ $randomNumber -eq $IS_TAILS -a $randomNumber2 -eq $IS_HEAD -a $randomNumber3 -eq $IS_TAILS ]
      then
            coin[THT]=$(( "${coin[THT]}" + 1 ))
		elif [ $randomNumber -eq $IS_HEAD -a $randomNumber2 -eq $IS_TAILS -a $randomNumber3 -eq $IS_HEAD ]
      then
            coin[HTH]=$(( "${coin[HTH]}" + 1 ))
	fi
done

echo ${coin[@]}
echo ${!coin[@]}
HH=`expr "scale=3; ( ${coin[HH]} / $plays ) * 100" | bc -l`
HT=`expr "scale=3; ( ${coin[HT]} / $plays ) * 100" | bc -l`
TT=`expr "scale=3; ( ${coin[TT]} / $plays ) * 100" | bc -l`
TH=`expr "scale=3; ( ${coin[TH]} / $plays ) * 100" | bc -l`
H=`expr "scale=3; ( ${coin[H]} / $plays ) * 100" | bc -l`
T=`expr "scale=3; ( ${coin[T]} / $plays ) * 100" | bc -l`
HHH=`expr "scale=3; ( ${coin[HHH]} / $plays ) * 100" | bc -l`
HHT=`expr "scale=3; ( ${coin[HHT]} / $plays ) * 100" | bc -l`
HTT=`expr "scale=3; ( ${coin[HTT]} / $plays ) * 100" | bc -l`
TTT=`expr "scale=3; ( ${coin[TTT]} / $plays ) * 100" | bc -l`
THH=`expr "scale=3; ( ${coin[THH]} / $plays ) * 100" | bc -l`
TTH=`expr "scale=3; ( ${coin[TTH]} / $plays ) * 100" | bc -l`
THT=`expr "scale=3; ( ${coin[THT]} / $plays ) * 100" | bc -l`
HTH=`expr "scale=3; ( ${coin[HTH]} / $plays ) * 100" | bc -l`

printf "H percentage: $H \nT percentage: $T \n"
printf "HH percentage: $HH \nHT percentage: $HT \nTT percentage: $TT\nTH percentage: $TH\n"
printf "HHH prcentage: $HHH \nHHT percentage: $HHT \nHTT percentage: $HTT \nTTT percentage: $TTT \nTHH percentage : $THH \nTTH percentage: $TTH \nTHT percentage: $THT \nHTH percentage: $HTH\n"


printf "sorted combinations are :\n"

for k in "${!coin[@]}"
do
   echo "$k" "-"  ${coin["$k"]}
done |
sort -n -k3

max=0
for k in ${!coin[@]}
do
	if [ $max -lt ${coin["$k"]} ]
		then
			max=${coin["$k"]}
			key="$k"
	fi
done
printf "Winning  combinations are :  $key -- $max \n" 
 77  
stage2review/sorting.sh
