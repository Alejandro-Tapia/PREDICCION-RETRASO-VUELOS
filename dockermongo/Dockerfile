#Para ejecutar este archivo hay que sacarlo de la carpeta dockermongo
FROM mongo:4.0

#Copia la información dentro de mongo-data (el contenido de distancias, etc) en la carpeta data del contenedor
COPY practica_creativa/data/origin_dest_distances.jsonl /data/
#Copia el archivo import_distances.sh en la carpeta docker-entrypoint... que se ejecuta al iniciar el contenedor
COPY practica_creativa/resources/import_distances.sh /docker-entrypoint-initdb.d/import_distances.sh

#Permisos de ejecución
RUN chmod +x /docker-entrypoint-initdb.d/import_distances.sh

EXPOSE 27017