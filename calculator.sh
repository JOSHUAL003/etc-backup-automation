#!/bin/bash

read -p "Enter first number:" a
read -p "Enter first number:" b
read -p "Enter operation(+ - / *): " op
case $op in 

+) result=$((a + b));;
-) result=$((a - b));;
/) result=$((a / b));;
\*) result=$((a * b));;
*) echo "Invalid option:" 
esac

echo "Result:" $result

