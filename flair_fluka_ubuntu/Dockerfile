FROM grzanka/ubuntu_vnc_ssh

# Install libraries
RUN echo "test\n" | /usr/bin/sudo -S bash -c "apt-get update && apt-get install -y \
    subversion make gcc gfortran \
    && rm -rf /var/lib/apt/lists/*"

RUN svn co http://svn.cern.ch/guest/flair/tags/release/

CMD echo "test\n" | /usr/bin/sudo -S /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && bash
