#! /bin/bash

case $1 in
"start")
{
    echo " -------- Starting Cluster --------"

    echo " -------- Starting Hadoop Cluster --------"
    /opt/module/hadoop/sbin/start-dfs.sh
    ssh NODE002 "/opt/module/hadoop/sbin/start-yarn.sh"

    # Start Zookeeper Cluster
    zookeeper.sh start

    sleep 4s

    # Start Flume Collection Cluster
    flume_cluster.sh start

    # Start Kafka Collection Cluster
    kafka_cluster.sh start

};;
"stop")
{
    echo " -------- Stopping Cluster --------"

    # Stop Kafka Collection Cluster
    kafka_cluster.sh stop

    sleep 6s

    # Stop Flume Collection Cluster
    flume_cluster.sh stop

    # Stop Zookeeper Cluster
    zookeeper.sh stop

    echo " -------- Stopping Hadoop Cluster --------"
    ssh NODE002 "/opt/module/hadoop/sbin/stop-yarn.sh"
    /opt/module/hadoop/sbin/stop-dfs.sh

};;
esac