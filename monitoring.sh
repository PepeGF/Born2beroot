#!/bin/bash
archi=$(uname -a)
num_cpu=$(nproc --all)
virtual_cpu=$(cat /proc/cpuinfo | grep processor | wc -l)

total_mem=$(free -m | grep Mem | awk '{print $2}')
used_mem=$(free -m | grep Mem | awk '{print $3}')
#percent_mem=$[${used_mem} * 100 / ${total_mem}]
percent_mem=$(free -m | grep Mem | awk '{printf "%.2f\n", $3*100/$2}')

total_disk_mb=$(df -m | grep /dev/mapper | awk '{temp += $2} END {print temp}')
total_disk=$(printf   $[$total_disk_mb/1024])
used_disk=$(df -m | grep /dev/mapper | awk '{temp2 += $4} END {print temp2}')
percent_disk=$(df -m | grep /dev/mapper/ | awk '{temp3 += $5} END {print temp3-"%"}')

cpu_load=$(top -bn1 | sed '1,7d' | awk '{temp4 += $9} END {printf "%.1f\n", temp4}')

last_boot=$(who -b | awk '{printf $3" "$4}')

lvm_active=$(lvm pvdisplay | grep Allocatable | awk '{print $2}')

conections_number=$(ss -s | awk '(NR==2) {print $4-","}')

user_log=$(who | awk '{print $1}' | uniq | wc -l)

ip_add=$(hostname -I)
mac_add=$(ip a | grep ether | awk '{print $2}')

sudo_commands=$(cat /var/log/sudo/sudo_logs | grep COMMAND | wc -l)

#------------------------------------------------------------------------------#

echo	"#Architecture: " $archi
echo	"#CPU physical :" $num_cpu
echo	"#vCPU :" $virtual_cpu
echo	"#Memory Usage: "$used_mem"/"$total_mem"MB ("$percent_mem"%)"
echo	"#Disk Usage: "$used_disk"/"$total_disk"Gb ("$percent_disk"%)"
echo	"#CPU load: "$cpu_load"%"
echo	"#Last boot: "$last_boot
echo	"#LVM use: "$lvm_active
echo	"#Connexions TCP : "$conections_number ESTABLISHED
echo	"#User log: "$user_log
echo	"#Network: IP "$ip_add"("$mac_add")"
echo	"#Sudo : "$sudo_commands "cmd"
