FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y git

RUN apt-get update \
    && apt-get install -y python3 python3-pip \
    && apt-get clean

RUN pip3 install pyyaml

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
