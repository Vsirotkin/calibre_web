# Use an official Python runtime as a parent image
FROM python:3.11.9-alpine3.20

# Set the working directory in the container
WORKDIR /app

# Copy the Pipfile and Pipfile.lock into the container
COPY Pipfile Pipfile.lock /app/

# Install Pipenv and use it to install the dependencies without using the cache
RUN pip install --no-cache-dir pipenv && pipenv install --system --deploy --skip-lock

# Copy the rest of your application's source code from your host to your image filesystem.
COPY . /app

# Make port 8083 available to the world outside this container
EXPOSE 8083

# Run app.py when the container launches
CMD ["python", "app.py"]
