FROM ubuntu:latest
MAINTAINER Leszek Grzanka <grzanka@agh.edu.pl>

# Install LXDE and VNC server.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Install ssh server
RUN apt-get update && apt-get install -y openssh-server supervisor sudo
RUN mkdir -p /var/run/sshd

# Install utilities
RUN apt-get update && apt-get install -y mc htop vim git coreutils expect \
    && rm -rf /var/lib/apt/lists/*

# start terminal automatically
RUN echo "@lxterminal --working-directory=/home/test/" >> /etc/xdg/lxsession/LXDE/autostart

# Add user
RUN useradd -ms /bin/bash test
RUN echo "test:test" | chpasswd
RUN adduser test sudo

# Activate user
USER test
WORKDIR /home/test

# Expose ports.
EXPOSE 22
EXPOSE 5901

# prepare VNC password ("qwerty")
RUN mkdir .vnc && chmod 700 .vnc
RUN echo "qwerty" | vncpasswd -f > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

# Add supervisor cfg, start it
ADD services.conf /etc/supervisor/conf.d/
CMD echo "test\n" | /usr/bin/sudo -S /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && bash
