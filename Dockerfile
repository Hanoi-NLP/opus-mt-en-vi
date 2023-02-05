# Use the official TensorFlow image as the base image
FROM tensorflow/tensorflow

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install necessary dependencies
RUN pip install --no-cache-dir Flask gunicorn

# Set the environment variable for running TensorFlow
ENV PYTHONPATH "$PYTHONPATH:/app"

# Command to run when the container starts
CMD [ "gunicorn", "--workers=2", "--bind=0.0.0.0:8000", "wsgi:app" ]
