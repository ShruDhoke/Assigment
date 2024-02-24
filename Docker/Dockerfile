# Use Ubuntu 16.04 as the base image
FROM ubuntu:16.04

# Update packages and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    telnet \
    curl \
    ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Set default command to launch bash
CMD ["bash"]
