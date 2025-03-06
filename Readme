# E-commerce Data Pipeline Project

This project demonstrates a data pipeline built using Hadoop, ZooKeeper, Flume, Kafka, Hive, and Apache Superset to perform data ingestion, analytics, and visualization.

## Project Overview

Apache Superset connects seamlessly with Hive and MySQL databases, enabling comprehensive visualization of analytical insights from the pipeline. Interactive dashboards were developed to analyze user behavior, including channel distribution, device usage patterns, and geographical trends.

## Project Structure

### Environment Management Scripts

#### Main Cluster Management
- **`allin1.sh`**: Orchestrates the start and stop of the entire pipeline environment.

#### Individual Service Management
- **`zookeeper.sh`**: Manages ZooKeeper services (start, stop, status).
- **`flume_cluster.sh`**: Controls Flume agents transferring data into Kafka.
- **`kafka_cluster.sh`**: Manages Kafka brokers across cluster nodes.

### Hive Analytical Scripts
- **`user device.txt`**: Analyzes device usage by brand.
- **`channel.txt`**: Generates analytics on channel distribution.
- **`use_province.txt`**: Aggregates user counts by province.
- **`load_data.txt`**: Loads raw data into Hive tables.

## Visualization

Apache Superset dashboards provide insights into:
- Channel distribution
- Device usage
- Geographic user trends

## Usage Instructions

### Start the Environment
```bash
./allin1.sh start
### Stop the Environment
```bash
./allin1.sh stop
## Manage Individual Services
```bash
./zookeeper.sh start
./flume_cluster.sh stop
System Requirements
## Linux environment with SSH across nodes (NODE002, NODE003, NODE004).
Software installations:
Java: /opt/module/jdk
Hadoop: /opt/module/hadoop
Kafka: /opt/module/kafka
Flume: /opt/module/flume
ZooKeeper: /opt/module/zookeeper
