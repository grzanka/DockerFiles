FROM alpine 
MAINTAINER Leszek Grzanka <grzanka@agh.edu.pl>

# Install utilities
RUN apk add --update bash sudo git make gfortran && rm -rf /var/cache/apk/* 

# Add user
RUN adduser -D -h /home/test -s /bin/bash test
RUN echo "test:test" | chpasswd
RUN echo "test    ALL=(ALL) ALL" >> /etc/sudoers

# Activate user
USER test
WORKDIR /home/test
