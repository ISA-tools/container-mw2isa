FROM ubuntu:16.04
MAINTAINER Philippe Rocca-Serra, philippe.rocca-serra@oerc.ox.ac.uk

LABEL Description="Convert MWTab to ISA-Tab"
LABEL software="mw2isa"
LABEL software.version="0.3.4"


RUN apt-get -y update && apt-get -y install --no-install-recommends python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install -U setuptools && \
    pip3 install isatools==0.3.4 && \
    pip3 uninstall -y pip3 && \
    apt-get purge -y python3-pip && \
    apt-get install --no-install-recommends python3 && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD run_test1.sh /usr/local/bin/run_test1.sh

ADD run_mwtab2isa.py /usr/local/bin/
RUN chmod a+x /usr/local/bin/run_mwtab2isa.py

ENTRYPOINT ["run_mwtab2isa.py"]
