#!/bin/bash

# Check if arguments are provided
if [ $# -lt 1 ]; then
    echo "No arguments provided. Usage: $0 {start|stop}"
    exit 1
fi

case $1 in
"start")
    echo "=================== Starting Hadoop Cluster ==================="

    echo "--------------- Starting HDFS ---------------"
    ssh NODE002 "/opt/module/hadoop/sbin/start-dfs.sh"

    echo "--------------- Starting YARN ---------------"
    ssh NODE003 "/opt/module/hadoop/sbin/start-yarn.sh"

    echo "--------------- Starting HistoryServer ---------------"
    ssh NODE002 "/opt/module/hadoop/bin/mapred --daemon start historyserver"
;;

"stop")
    echo "=================== Stopping Hadoop Cluster ==================="

    echo "--------------- Stopping HistoryServer ---------------"
    ssh NODE002 "/opt/module/hadoop/bin/mapred --daemon stop historyserver"

    echo "--------------- Stopping YARN ---------------"
    ssh NODE003 "/opt/module/hadoop/sbin/stop-yarn.sh"

    echo "--------------- Stopping HDFS ---------------"
    ssh NODE002 "/opt/module/hadoop/sbin/stop-dfs.sh"
;;

*)
    echo "Invalid argument. Usage: $0 {start|stop}"
    exit 1
;;
esac
