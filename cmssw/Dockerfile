FROM grzanka/slc6-cmssw

ADD manifest.pp /

RUN /bin/bash --login -c "puppet apply -d --modulepath=/modules /manifest.pp"

#RUN sudo usermod -aG sudo cmsbuild

RUN echo "cmsbuild ALL=(ALL) ALL" >> /etc/sudoers

USER cmsbuild
WORKDIR /home/cmsbuild

ENV SCRAM_ARCH=slc6_amd64_gcc493

RUN source /opt/cms/cmsset_default.sh && \
    scram project CMSSW CMSSW_8_1_0_pre1

CMD /bin/bash
