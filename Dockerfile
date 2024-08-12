# Use an official image as a parent image
FROM python:3.10-slim

# Install Docker CLI and other dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    docker.io \
    git \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Docker Compose (optional, if you need it)
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . /app

# Set default command (optional)
CMD ["bash"]
