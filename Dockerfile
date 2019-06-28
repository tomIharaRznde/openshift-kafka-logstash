FROM logstash:6.6.2

WORKDIR /usr/share/logstash

COPY --chown=logstash:logstash config/logstash.yml    /usr/share/logstash/config/
COPY --chown=logstash:logstash config/pipelines.yml   /usr/share/logstash/config/
COPY --chown=logstash:logstash pipeline/logstash.conf /usr/share/logstash/pipeline/
