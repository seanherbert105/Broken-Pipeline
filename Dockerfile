# Is the registry correct?
# This should be referencing the Docker Hub registry.
# Defines base container image to install Python pip packages.
FROM docker.com/python:3.8-alpine AS builder

RUN apk add --no-cache python3-dev py3-pip py3-virtualenv gcc musl-dev libffi-dev && \
    python3 -m venv venv

# Define the new Python Virtual Environment to an executable path. 
ENV PATH="/venv/bin:$PATH"

# Is this the correct location of where requirements.txt is located within the repository?
# Copy document that defines all required Python pip packages.
COPY requirements.txt /

# Install all Python pip packages.
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install -r requirements.txt

# Is the registry correct?
# This should be referencing the Docker Hub registry.
# Defines base container image for running application.
FROM docker.com/python:3.8-alpine

# Copy venv from builder
COPY --from=builder /venv /venv

# Define the new Python Virtual Environment to an executable path. 
ENV PATH="/venv/bin:$PATH"

# Is this file directory name correct?
# Creates working directory for application to run.
WORKDIR /broken-app

# How can the file copy correctly to an incorrect file directory name?
# Copy app.py file.
COPY app/app.py /app

# How can this command run correctly when you're in the wrong file directory?
# Run application.
CMD ["python3", "app.py"]