FROM grzanka/slc6-cmssw

ADD manifest.pp /

RUN /bin/bash --login -c "puppet apply -d --modulepath=/modules /manifest.pp"

CMD /bin/bash
