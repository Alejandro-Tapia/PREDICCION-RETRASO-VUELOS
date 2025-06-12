# Imagen base con Spark, Java y Python
FROM apache/spark:3.5.3-scala2.12-java17-python3-r-ubuntu

ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

# Cambiar a root para instalar paquetes
USER root

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y curl git

# Instalar sbt 1.5.5 desde el tgz
ENV SBT_VERSION=1.5.5
RUN curl -L -o sbt.tgz https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz && \
    tar -xvzf sbt.tgz -C /opt/ && \
    rm sbt.tgz && \
    ln -s /opt/sbt/bin/sbt /usr/local/bin/sbt

# Crear directorio de trabajo
WORKDIR /app

# Copiar el proyecto
COPY practica_creativa /app/practica_creativa

# Cambiar al directorio del proyecto
WORKDIR /app/practica_creativa/flight_prediction 

# Ejecutar sbt package para compilar el proyecto
RUN sbt package

# Ejecutar spark-submit con los paquetes necesarios
CMD ["spark-submit", "--packages", "org.mongodb.spark:mongo-spark-connector_2.12:10.4.1,org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.3", "flight_prediction/project/target/scala-2.12/flight_prediction_2.12-1.0.jar"]
 