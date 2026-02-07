FROM python:3.12-slim

# Install required system dependencies
RUN apt update && apt install -y \
    git gcc python3-dev libffi-dev build-essential \
    && apt upgrade -y

# Set up working directory
RUN mkdir /fwdbot
WORKDIR /fwdbot

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

# Copy all project files into the working directory
COPY . .

# Ensure start.sh has execution permissions
RUN chmod +x start.sh

# Start the application
CMD ["/bin/bash", "start.sh"]
