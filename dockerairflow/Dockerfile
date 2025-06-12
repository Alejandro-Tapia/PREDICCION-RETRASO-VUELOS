FROM python:3.6-slim

ENV AIRFLOW_HOME=/airflow

COPY practica_creativa .
RUN pip install -r resources/airflow/requirements.txt -c resources/airflow/constraints.txt
RUN pip install -r requirements.txt

RUN mkdir -p $AIRFLOW_HOME/dags $AIRFLOW_HOME/logs $AIRFLOW_HOME/plugins

COPY practica_creativa/resources/airflow/setup.py $AIRFLOW_HOME/dags/

RUN apt-get update && apt-get install -y supervisor && apt-get clean
COPY practica_creativa/resources/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV SPARK_VERSION=3.5.1
ENV HADOOP_VERSION=3
ENV SPARK_HOME=/opt/spark
ENV PATH="${SPARK_HOME}/bin:${PATH}"

RUN apt-get update && apt-get install -y curl openjdk-11-jdk && \
    curl -L https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    | tar -xz -C /opt && \
    mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark

EXPOSE 8181

CMD bash -c "\
  airflow db init && \
  airflow users create --username admin --firstname Mario --lastname Tapia --role Admin --email example@mail.org --password admin && \
  supervisord"