#!/bin/bash

BOLD=$'\033[1m'
RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
LIGHT_BLUE=$'\033[1;34m'
NC=$'\033[0m' # No Color

echo "${BOLD}Kernel/OS:${NC}"
echo "- ${BOLD}Version:${NC} $(</proc/version)"
echo "- ${BOLD}Host name:${NC} $(</proc/sys/kernel/hostname)"
echo "- ${BOLD}Domain name:${NC} $(</proc/sys/kernel/domainname)"
echo "- ${BOLD}OS type:${NC} $(</proc/sys/kernel/ostype)"
echo "- ${BOLD}OS release:${NC} $(</proc/sys/kernel/osrelease)"

echo $'\n'
echo "${BOLD}CPU:${NC}"
echo "- ${BOLD}PMU name:${NC} $(</sys/devices/cpu/caps/pmu_name)"
echo "- ${BOLD}Branches:${NC} $(</sys/devices/cpu/caps/branches)"
echo "- ${BOLD}Max precise:${NC} $(</sys/devices/cpu/caps/max_precise)"
echo "- ${BOLD}Core type:${NC} $(</sys/devices/cpu/type)"
echo "- ${BOLD}Performance-event-multiplexer interval in mili-seconds:${NC} $(</sys/devices/cpu/type)"
echo "- ${BOLD}Power control:${NC} $(</sys/devices/cpu/power/control)"
echo "- ${BOLD}Current idle driver:${NC} $(</sys/devices/system/cpu/cpuidle/current_driver)"
echo "- ${BOLD}Architecture:${NC} $(</proc/sys/kernel/arch)"
