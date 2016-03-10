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
    python3-pip \
    python3-numpy python3-scipy python3-matplotlib \
    python3-pyqt5 \
    && rm -rf /var/lib/apt/lists/*

# Install python packages
RUN pip3 install pydicom

# start terminal automatically
RUN echo "@lxterminal --working-directory=/home/test/git" >> /etc/xdg/lxsession/LXDE/autostart

# Add user
RUN useradd -ms /bin/bash test
RUN echo "test:test" | chpasswd
RUN adduser test sudo

# Make directory to host tests
RUN mkdir -p /home/test/git
RUN chown test:test /home/test/git

# Activate user
USER test
WORKDIR /home/test

# Expose ports.
EXPOSE 22
EXPOSE 5901

# prepare VNC password ("qwerty")
RUN mkdir .vnc && chmod 700 .vnc
RUN echo "qwerty" | vncpasswd -f > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

# clone some example repository
RUN cd ~/git && git clone https://github.com/Programmica/pyqt5-tutorial.git

# Add supervisor cfg, start it
ADD services.conf /etc/supervisor/conf.d/
CMD echo "test\n" | /usr/bin/sudo -S /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && bash
