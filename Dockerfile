FROM openshift/redhat-openjdk18-openshift:1.2

USER root

RUN \
    set -e ; \
    mkdir /opt/app-root ;\
    curl -Lo /tmp/elasticsearch-2.4.6.zip https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/zip/elasticsearch/2.4.6/elasticsearch-2.4.6.zip ; \
	unzip -o -d /opt/app-root /tmp/elasticsearch-2.4.6.zip

RUN useradd -r elastic

RUN ls -la /opt/app-root

RUN ls -la /opt/app-root/bin

RUN chown -R elastic /opt/app-root ; \
	chgrp -R 0 /opt/app-root ; \
	chmod -R g+rw /opt/app-root

RUN ls -la /opt/app-root

RUN ls -la /opt/app-root/bin	

USER elastic

CMD [ "/opt/app-root/bin/elasticsearch"]
