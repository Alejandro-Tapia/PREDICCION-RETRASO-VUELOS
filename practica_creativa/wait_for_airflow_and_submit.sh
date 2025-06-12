#!/bin/bash

# Archivo de espera
# sleep 300

# Ejecutar el spark-submit después de que el archivo esté presente
/spark/bin/spark-submit --conf spark.kafka.bootstrap.servers=kafka:9092 --packages org.mongodb.spark:mongo-spark-connector_2.12:10.4.1,org.apache.spark:spark-sql-kafka-0-10_2.12:3.2.1 --class es.upm.dit.ging.predictor.MakePrediction --master spark://spark-master:7077 practica_creativa/flight_prediction/target/scala-2.12/flight_prediction_2.12-0.1.jar
