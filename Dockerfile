FROM python:3.7-slim-buster

RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python3-dev
RUN pip install transformers Flask gunicorn

COPY . /app
WORKDIR /app

COPY app.py .

CMD gunicorn --workers 4 --bind 0.0.0.0:8080 app:app
