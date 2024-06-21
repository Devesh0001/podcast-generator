FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y git

RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN python3 --version
RUN pip3 --version

RUN pip3 install virtualenv

# Create a directory for your application
WORKDIR /app

# Create a virtual environment and activate it
RUN python3 -m virtualenv venv
ENV PATH="/app/venv/bin:$PATH"

RUN pip3 install pyyaml

COPY feed.py /app/feed.py
COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
