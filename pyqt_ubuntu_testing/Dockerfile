FROM ubuntu:14.04
MAINTAINER Leszek Grzanka <grzanka@agh.edu.pl>

# Install LXDE and VNC server.
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y lxde-core lxterminal tightvncserver && \
  rm -rf /var/lib/apt/lists/*

# Install ssh server
RUN apt-get update && apt-get install -y openssh-server supervisor
RUN mkdir -p /var/run/sshd

# Install utilities
RUN apt-get update && apt-get install -y mc htop vim git coreutils expect \
    && rm -rf /var/lib/apt/lists/*

# Install libraries
RUN apt-get update && apt-get install -y \
    python3-numpy \
    python3-scipy \
    python3-matplotlib \
    && rm -rf /var/lib/apt/lists/*

# Add user
RUN useradd -ms /bin/bash grzanka
RUN echo "grzanka:grzanka" | chpasswd
RUN adduser grzanka sudo


# Activate user
USER grzanka
WORKDIR /home/grzanka

# Expose ports.
EXPOSE 22
EXPOSE 5901

# prepare VNC password ("qwerty")
RUN mkdir .vnc && chmod 700 .vnc
RUN echo "qwerty" | vncpasswd -f > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

# Add supervisor cfg, start it
ADD services.conf /etc/supervisor/conf.d/
CMD echo "grzanka\n" | /usr/bin/sudo -S /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && bash
