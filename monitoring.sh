#!/bin/bash
archi=$(uname -a)
num_cpu=$(nproc --all)
virtual_cpu=$(cat /proc/cpuinfo | grep processor | wc -l)

total_mem=$(free -m | awk '{print $2}' | awk '(NR==2)')
used_mem=$(free -m | awk '{print $3}' | awk '(NR==2)')
#percent_mem=$[${used_mem} * 100 / ${total_mem}]
percent_mem=$(free -m | awk '(NR==2){printf "%.2f\n", $3*100/$2}')

total_disk=$[$(df -h | awk '(NR==4) {print $2-"G"}') + $(df -h | awk '(NR==8) {print $2-"G"}')]
used_disk=$[$(df -m | awk '(NR==4) {print $4}') + $(df -m | awk '(NR==8) {print $4}')]
percent_disk=$[$(df -m | awk '(NR==4) {print $5-"%"}') + $(df -m | awk '(NR==8) {print $5-"%"}')]

wololo=2.7 + 3.4
echo "-----------"
echo $wololo
echo "----------"

echo "          "

echo	"#Architecture: " $archi
echo	"CPU physical :" $num_cpu
echo	"vCPU :" $virtual_cpu
echo	"Memory Usage: " $used_mem"/"$total_mem"MB ("$percent_mem"%)"
echo	"Disk Usage: " $used_disk"/"$total_disk"Gb ("$percent_disk"%)"
echo	"CPU load: "
echo	"Last boot: "
echo	"LVM use: "
echo	"Connexions TCP : "
echo	"User log: "
echo	"Network: "
echo	"Sudo :"

echo	"------__---"


#grep MemAvailable/proc/meminfo



#echo $used_mem
#echo $total_mem
#used_mem=$(grep "\<Cached\>" /proc/meminfo | awk '{print $2}')
#total_mem=$(grep MemTotal /proc/meminfo | awk '{print $2}')

#cron parece que para ejecutar preriodicamente
#positional parameters
#expr para hacer operaciones
# https://linuxconfig.org/bash-scripting-tutorial-for-beginners
# echo 'scale=3;1/3' | bc
# variable = $( echo 'scale=3;1/3' | bc)
# echo $(variable)
