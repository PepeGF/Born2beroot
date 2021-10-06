#!/bin/bash
echo	"#Architecture: " $(uname -a)
echo	"CPU physical :" $(nproc --all)
echo	"vCPU :" $(cat /proc/cpuinfo | grep processor | wc -l)
