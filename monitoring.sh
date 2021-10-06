#!/bin/bash
echo	"#Architecture: " $(uname -a)
echo	"CPU physical :" $(nproc --all)
echo	"vCPU :" $(cat /proc/cpuinfo | grep processor | wc -l)
#grep MemAvailable/proc/meminfo

used_mem=$(grep "\<Cached\>" /proc/meminfo | awk '{print $2}')

total_mem=$(grep MemTotal /proc/meminfo | awk '{print $2}')

echo $used_mem
echo $total_mem
echo $[$used_mem*100/${total_mem}]"%"

#cron parece que para ejecutar preriodicamente
#positional parameters
#expr para hacer operaciones
# https://linuxconfig.org/bash-scripting-tutorial-for-beginners
# echo 'scale=3;1/3' | bc
# variable = $( echo 'scale=3;1/3' | bc)
# echo $(variable)
