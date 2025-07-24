#!/bin/bash

add()
{
echo "$(( $1 + $2 ))"
}

subtract()
{
echo "$((  $1 - $2 ))"
}


multiply()
{
echo "$((  $1 * $2 ))"
}


divide()

{
if [ "$2" -eq 0 ]
then
echo "Cannot divide by 0"
else
echo "$((  $1 / $2 ))"
fi
}


read -p "enter number:" a 
read -p "enter number:" b 
echo "1.Add"
echo "2.Subtract"
echo "3.Multiply"
echo "4.Divide"
echo "5.exit"

read -p "Choose Operation :" op

case "$op" in
1) add "$a" "$b";;
2) subtract "$a" "$b";;
3) multiply "$a" "$b";;
4) divide "$a" "$b";;
5) echo "exiting.......machuneeeeeeeeeeee"; exit 0;;
*) echo "invalid choice"
esac
