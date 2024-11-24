#!/bin/bash

case $1 in
"start")
{
    echo "-------- Starting Zookeeper Cluster --------"
    nodes=("NODE002" "NODE003" "NODE004")
    
    for node in "${nodes[@]}"
    do
        echo ">>> Starting Zookeeper on $node"
        ssh $node "/opt/module/zookeeper/bin/zkServer.sh start"
        echo ">>> Zookeeper started on $node"
    done
    echo "-------- Zookeeper Cluster Started --------"
};;

"stop")
{
    echo "-------- Stopping Zookeeper Cluster --------"
    nodes=("NODE002" "NODE003" "NODE004")
    
    for node in "${nodes[@]}"
    do
        echo ">>> Stopping Zookeeper on $node"
        ssh $node "/opt/module/zookeeper/bin/zkServer.sh stop"
        echo ">>> Zookeeper stopped on $node"
    done
    echo "-------- Zookeeper Cluster Stopped --------"
};;

"status")
{
    echo "-------- Checking Zookeeper Cluster Status --------"
    nodes=("NODE002" "NODE003" "NODE004")
    
    for node in "${nodes[@]}"
    do
        echo ">>> Checking Zookeeper status on $node"
        ssh $node "/opt/module/zookeeper/bin/zkServer.sh status"
    done
    echo "-------- Zookeeper Cluster Status Checked --------"
};;

*)
    echo "Usage: $0 {start|stop|status}"
    exit 1
;;
esac
