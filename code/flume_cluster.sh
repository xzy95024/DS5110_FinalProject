#!/bin/bash

case $1 in
"start")
{
    echo "-------- Initiating Flume agents across nodes --------"
    nodes=("NODE002" "NODE003")
    
    for node in "${nodes[@]}"
    do
        echo ">>> Starting Flume agent on $node"
        ssh $node "nohup /opt/module/flume/bin/flume-ng agent \
            -n agent1 \
            -c /opt/module/flume/conf/ \
            -f /opt/module/flume/job/file_to_kafka.conf \
            >/dev/null 2>&1 &"
        echo ">>> Flume agent started on $node"
    done
    echo "-------- All Flume agents have been initiated --------"
};;

"stop")
{
    echo "-------- Terminating Flume agents on all nodes --------"
    nodes=("NODE002" "NODE003")
    
    for node in "${nodes[@]}"
    do
        echo ">>> Stopping Flume agent on $node"
        ssh $node "ps -ef | grep file_to_kafka | grep -v grep | awk '{print \$2}' | xargs -r kill -9"
        echo ">>> Flume agent stopped on $node"
    done
    echo "-------- All Flume agents have been terminated --------"
};;

*)
    echo "Usage: $0 {start|stop}"
    exit 1
;;
esac
