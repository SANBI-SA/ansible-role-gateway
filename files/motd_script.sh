#!/usr/bin/env bash

. /etc/lsb-release

LOAD=$(cat /proc/loadavg | cut -d' ' -f 2);
CPU_COUNT=$(cat /proc/cpuinfo | grep -i "core id" | uniq | wc -l);
THREAD_COUNT=$(cat /proc/cpuinfo | grep -i "core id" | wc -l);

#APT_UPDATE_DETAILS="$(/usr/lib/update-notifier/apt-check --human-readable | fold -w 40 -s)"

IPV4_ADDRESS=$(dig +short myip.opendns.com A @resolver1.opendns.com)
#IPV6_ADDRESS=$(dig +short myip.opendns.com AAAA @2620:0:ccc::2);

LAST_LOGIN=$(last -1 | head -n 1 | awk '{ print $1,"at",$4,$5,$6,$7,"from",$3 }');

#REBOOT_REQUIRED=$(/usr/lib/update-notifier/update-motd-reboot-required);

echo
echo Welcome to the {{ company_name }} {{ remote_server_name }}
echo "  running on {{ ansible_lsb.description }}"
echo
echo Kernel: {{ ansible_kernel }}
echo Uptime: $(uptime --pretty | sed -e 's/up //')
echo Load: ${LOAD}
echo
echo IPs: ${IPV4_ADDRESS}
echo
# echo "${APT_UPDATE_DETAILS}"
# echo
# echo "${REBOOT_REQUIRED}"
#echo
#echo Last login: ${LAST_LOGIN}

exit 0