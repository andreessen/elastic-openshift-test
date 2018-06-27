FROM openshift/redhat-openjdk18-openshift:1.2

RUN chown -R 1001:0 /opt && chown -R 1001:0 $HOME && \
    chmod -R ug+rwX /opt

RUN \
    set -e ; \
    mkdir /elastic ;\
    curl -Lo /tmp/elasticsearch-2.4.6.zip https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/zip/elasticsearch/2.4.6/elasticsearch-2.4.6.zip ; \
	unzip -j -d /elastic /tmp/elasticsearch-2.4.6.zip

CMD [ "/elastic/bin/elasticsearch"]
