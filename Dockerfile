FROM ubuntu:latest

RUN apt-get update 
RUN apt-get install -y 
RUN python3.10 
RUN python3-pip
RUN git

RUN pip3 install pyyaml

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
