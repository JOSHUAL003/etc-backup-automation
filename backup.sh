#!/bin/bash

LOG_DIR="/var/log/devops_toolkit"
BACKUP_DIR="var/backups/devops_toolkit"

mkdir -p "$LOG_DIR" "$BACKUP_DIR"

log_file="$LOG_DIR"/system_health_$(date +%F).log

function check_disk_space()
{
echo "Disk Space:"
df -h | tee -a "$log_file"
}

function show_uptime()

{
echo "System Uptime:"
uptime | tee -a "$log_file"
}

function list_users()

{
echo "List Users:"
 who | tee -a "$log_file"
}

function backup_etc()
{
tar_file="$BACKUP_DIR"/etc_backup_$(date +%F_%H%M).tar.gz
sudo tar -czf "$tar_file" /etc
echo "Backup saved to $tar_file" | tee -a "$log_file"
}

function system_health_monitor()
{
echo -e "\n CPU and Memory:" | tee -a "$log_file"
echo "CPU load : $(uptime)" >> "$log_file"
echo "Memory Usage:" >> "$log_file"
free -h >>"$log_file"
echo -e "Disk:\n " >>"$log_file"
df -h >> "$log_file"
echo " System health logged to $log_file"
}
function manage_users()
{
echo "User Management:"
echo "1.Add User:"
echo "2.Delete User:"
read -rp "Choose option:" choice
read -rp "Enter username:"  user
case "$choice" in


1) 
sudo useradd "$user"
sudo passwd "$user"
echo "User $user added";;

2)
sudo userdel -r "$user"
echo "User $user deleted";;

*) echo "Invalid choice"
 esac
}

function full_backup_cronjob()
{
backup_etc
check_disk_space
system_health_monitor

}


while true;
do 
echo -e "Linux toolkit Menu:"
echo "1. Check Disk Space"
echo "2. Show Uptime"
echo "3. List Logged-in users"
echo "4. Backup /etc directory"
echo "5. System Health Monitor"
echo "6. Manage Users"
echo "7. Run all tasks"
echo "8. Exit"

    read -rp "Enter choice [1-8]: " input
    case "$input" in
        1) check_disk_space ;;
        2) show_uptime ;;
        3) list_users ;;
        4) backup_etc ;;
        5) system_health_monitor ;;
        6) manage_users ;;
        7) full_backup_cronjob ;;
        8) echo "Exiting."; exit 0 ;;
        *) echo "Invalid option." ;;
    esac
done
