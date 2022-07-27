#!/bin/bash -x

declare -A arithmeticComputation
echo "Welcome To Arithmetic Computaion And Sorting"
echo "Enter the 3 inputs a b  and c"
echo -n "a = "
read  a
echo -n "b = "
read  b
echo -n "c = "
read  c
firstComputation="$(( a + ( b * c) ))"
echo "First Arithmetic Computation result is : $firstComputation"
secondComputation="$(( (a *  b) + c ))"
echo "Second Arithmetic Computation result is : $secondComputation"
thirdComputation="$(( c + (a / b) ))"
echo "Third Arithmetic Computation result is : $thirdComputation"
fourthComputation="$(( (a % b) + c ))"
echo "Fourth Arithmetic Computation result is : $fourthComputation"

arithmeticComputation[firstComputation]=$firstComputation
arithmeticComputation[secondComputation]=$secondComputation
arithmeticComputation[thirdComputation]=$thirdComputation
arithmeticComputation[fourthComputation]=$fourthComputation
echo "All computation result are stored in dictionary: "
echo ${arithmeticComputation[@]}
counter=0
for i in "${arithmeticComputation[@]}"
do
	array[counter]=$i
	counter=$(($counter + 1))
done
echo "All computation result are stored in array: " 
echo ${array[@]}

for ((i = 0; i<4; i++))
do
    for((j = 0; j<4-i-1; j++))
    do
        if [ ${array[j]} -lt ${array[$((j+1))]} ]
        then
            temp=${array[j]}
            array[$j]=${array[$((j+1))]}
            array[$((j+1))]=$temp
        fi
    done
done
echo "Computation result stored in descending order :"
echo ${array[@]}

for ((i = 0; i<4; i++))
do
    for((j = 0; j<4-i-1; j++))
    do
        if [ ${array[j]} -gt ${array[$((j+1))]} ]
        then
            temp=${array[j]}
            array[$j]=${array[$((j+1))]}
            array[$((j+1))]=$temp
        fi
    done
done

echo "Computation result stored in ascending order :"
echo ${array[@]}
