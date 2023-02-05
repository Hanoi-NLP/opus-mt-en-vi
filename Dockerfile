FROM tensorflow/tensorflow:2.5.0-py3

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY wsgi.py .

EXPOSE 5000

CMD ["python", "wsgi.py"]
