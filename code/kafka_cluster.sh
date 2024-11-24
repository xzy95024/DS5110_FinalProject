#!/bin/bash

case $1 in
"start")
{
    echo "-------- Launching Kafka Brokers on Nodes --------"
    nodes=("NODE002" "NODE003" "NODE004")
    
    for node in "${nodes[@]}"
    do
        echo ">>> Starting Kafka on $node"
        ssh $node "/opt/module/kafka/bin/kafka-server-start.sh -daemon /opt/module/kafka/config/server.properties"
        echo ">>> Kafka successfully started on $node"
    done
    echo "-------- All Kafka Brokers are now running --------"
};;

"stop")
{
    echo "-------- Shutting Down Kafka Brokers --------"
    nodes=("NODE002" "NODE003" "NODE004")
    
    for node in "${nodes[@]}"
    do
        echo ">>> Stopping Kafka on $node"
        ssh $node "/opt/module/kafka/bin/kafka-server-stop.sh stop"
        echo ">>> Kafka successfully stopped on $node"
    done
    echo "-------- All Kafka Brokers have been stopped --------"
};;

*)
    echo "Usage: $0 {start|stop}"
    exit 1
;;
esac
