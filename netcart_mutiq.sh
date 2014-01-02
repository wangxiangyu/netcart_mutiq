#!/bin/bash
queues_count=0
for i in /sys/class/net/eth0/queues/rx*
do
    echo ffe >  $i/rps_cpus
    echo 4096 >  $i/rps_flow_cnt
    cat $i/rps_cpus
    cat $i/rps_flow_cnt
    ((queues_count++))
done
((total_rps_sock_flow_entries=4096*queues_count))
echo $total_rps_sock_flow_entries > /proc/sys/net/core/rps_sock_flow_entries
