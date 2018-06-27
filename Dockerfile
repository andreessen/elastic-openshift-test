FROM openshift/redhat-openjdk18-openshift:1.2

USER root

ENV \
    EL_HOME=$APP_ROOT/elasticsearch-$EL_VERSION

RUN \
    set -e ; \
    mkdir ${APP_ROOT} ;\
    curl -Lo /tmp/elasticsearch.zip https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/zip/elasticsearch/${EL_VERSION}/elasticsearch-${EL_VERSION}.zip ; \
	unzip -o -d ${APP_ROOT} /tmp/elasticsearch.zip

RUN useradd -r elastic

RUN chown -R elastic ${APP_ROOT} ; \
	chgrp -R 0 ${APP_ROOT} ; \
	chmod -R g+rw ${APP_ROOT} ; \
	chmod 775 ${EL_HOME}/bin/elasticsearch

USER elastic

CMD [ "${EL_HOME}/bin/elasticsearch"]
