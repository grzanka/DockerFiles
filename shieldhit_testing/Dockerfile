FROM debian:testing
MAINTAINER Leszek Grzanka <grzanka@agh.edu.pl>

# Install necessary packages
RUN apt-get -qq update && \
    apt-get install -qq -y git gfortran make && \
    apt-get install -qq -y python3 python3-setuptools && \
    apt-get install -qq -y python3-numpy && \
    rm -rf /var/lib/apt/lists/*

# Add user
RUN useradd -m -d /home/test/ test
RUN echo "test:test" | chpasswd
RUN echo "test    ALL=(ALL) ALL" >> /etc/sudoers

# Activate user
USER test
WORKDIR /home/test
