FROM grzanka/ubuntu_vnc_ssh

# Install libraries
RUN echo "test\n" | /usr/bin/sudo -S bash -c "apt-get update && apt-get install -y \
    g++ make gcc gfortran \
    python-dev python-tk tk-dev \
    subversion gnuplot \
    && rm -rf /var/lib/apt/lists/*"

RUN svn co http://svn.cern.ch/guest/flair/tags/release/

RUN mkdir -p usr/flair

RUN /home/test/release/flair/install.sh -i /home/test/usr/flair/

CMD echo "test\n" | /usr/bin/sudo -S /usr/bin/supervisord -c /etc/supervisor/supervisord.conf && bash
