FROM python:3.6-slim

WORKDIR /app

COPY practica_creativa/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY practica_creativa .

EXPOSE 5001 

ENTRYPOINT ["python3", "/app/resources/web/predict_flask.py"]