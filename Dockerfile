# Use the Python base image from AWS ECR
FROM 763104351884.dkr.ecr.us-west-2.amazonaws.com/python:3.9.0

# Set the working directory in the container
WORKDIR /app

# Copy the required files to the container
COPY . .

# Install the required packages
RUN pip install -r requirements.txt

# Set the environment variable for Flask
ENV FLASK_APP=wsgi.py

# Expose port 5000 for the Flask app
EXPOSE 5000

# Start the Flask app
CMD ["flask", "run", "--host=0.0.0.0"]
