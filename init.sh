#!/bin/bash

CONFIG=/opt/bitnami/kafka/config/kraft/server.properties
cat >> $CONFIG <<EOF
listeners=PLAINTEXT://0.0.0.0:9092,CONTROLLER://:9093
advertised.listeners=PLAINTEXT://kafka:9092
listener.security.protocol.map=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT
controller.listener.names=CONTROLLER
EOF
# Generar cluster ID y formatear almacenamiento
CLUSTER_ID=$(/opt/bitnami/kafka/bin/kafka-storage.sh random-uuid)
/opt/bitnami/kafka/bin/kafka-storage.sh format -t $CLUSTER_ID -c $CONFIG

# Iniciar Kafka en segundo plano
/opt/bitnami/kafka/bin/kafka-server-start.sh $CONFIG &

sleep 10

# Crear tópicos
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic flight-delay-ml-request --partitions 1 --replication-factor 1
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic flight-delay-ml-result --partitions 1 --replication-factor 1

wait