FROM ubuntu:latest

## Avoid interactive questions when installing packages
ENV DEBIAN_FRONTEND=noninteractive

## Use different shell (default is /bin/sh)
SHELL ["/bin/bash", "-c"]

## Install system dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        python3-pip \
        python3-dev \
        python3-opencv \
        libglib2.0-0 \
        openjdk-11-jdk
        
## Set the working directory
WORKDIR /app

## Install python packages
COPY ./requirements.txt ./requirements.txt
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

## Set the entrypoint
ENTRYPOINT [ "/bin/bash" ]
