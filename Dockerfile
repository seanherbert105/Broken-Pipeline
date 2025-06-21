# Defines base container image to install Python pip packages.
FROM docker.io/python:3.8-alpine AS builder

RUN apk add --no-cache python3-dev py3-pip py3-virtualenv gcc musl-dev libffi-dev && \
    python3 -m venv venv

# Define the new Python Virtual Environment to an executable path. 
ENV PATH="/venv/bin:$PATH"

# Copy document that defines all required Python pip packages.
COPY app/requirements.txt /

# Install all Python pip packages.
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install -r requirements.txt

# Defines base container image for running application.
FROM docker.io/python:3.8-alpine

# Copy venv from builder
COPY --from=builder /venv /venv

# Creates working directory for application to run.
WORKDIR /app

# Copy app.py file.
COPY app/app.py /app

# Run application.
CMD ["python3", "app.py"]