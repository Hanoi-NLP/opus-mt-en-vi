FROM tensorflow/tensorflow

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY wsgi.py .

EXPOSE 5000

CMD ["python", "wsgi.py"]
