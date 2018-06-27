FROM openshift/redhat-openjdk18-openshift:1.2

RUN \
    set -e ; \
    curl -L -O /tmp https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.6/elasticsearch-2.4.6.zip
; \
	unzip -j -d /opt/app-root /tmp/elasticsearch-2.4.6.zip ; \

CMD [ "/opt/app-root/bin/elasticsearch"]
