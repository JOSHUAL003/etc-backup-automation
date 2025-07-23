#!/bin/bash

echo "Choose an option:"
echo "1. SHow date"
echo "Show Uptime"
echo "3.Exit"

read -p "Enter Choice [1-3]:" choice

case $choice in

1) date;;
2)uptime;;
3)exit 0;;
*) echo "Invalid choice"

esac
