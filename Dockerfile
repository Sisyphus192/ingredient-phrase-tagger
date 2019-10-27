# reference: https://hub.docker.com/_/ubuntu/
FROM ubuntu:18.04

# Adds metadata to the image as a key value pair example LABEL version="1.0"
LABEL maintainer="Derek Thomas <deth4407@colorado.edu>"

##Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y build-essential git python3 python3-pip ruby

# Install CRF++.
RUN git clone https://github.com/mtlynch/crfpp.git && \
    cd crfpp && \
    ./configure && \
    make && \
    make install && \
    ldconfig && \
    cd ..

# Install ingredient-phrase-tagger.
RUN git clone https://github.com/Sisyphus192/ingredient-phrase-tagger && \
    cd ingredient-phrase-tagger && \
    python3 setup.py install

WORKDIR /ingredient-phrase-tagger