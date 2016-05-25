FROM alpine 
MAINTAINER Leszek Grzanka <grzanka@agh.edu.pl>

# Install utilities
RUN apk add --update build-base bash sudo git make gfortran python3 && rm -rf /var/cache/apk/*

# Install pip3
RUN python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache

# Add user
RUN adduser -D -h /home/test -s /bin/bash test
RUN echo "test:test" | chpasswd
RUN echo "test    ALL=(ALL) ALL" >> /etc/sudoers

# Activate user
USER test
WORKDIR /home/test
