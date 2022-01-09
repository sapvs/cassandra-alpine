ARG OPENJRE_VERSION
FROM sapvs/openjre-alpine:${OPENJRE_VERSION}

ARG CASSANDRA_VERSION
WORKDIR /

ADD https://downloads.apache.org/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz /

COPY start_cassandra.sh /

RUN tar -xzf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
  && mv apache-cassandra-${CASSANDRA_VERSION} cassandra \
  && rm apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz\
  && chown -R java:java /cassandra\
  && chown -R java:java /start_cassandra.sh\
  && chmod a+x /start_cassandra.sh


# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160

USER java
ENTRYPOINT [ "./start_cassandra.sh"]

CMD [ "cassandra", "-f"]
