ARG OPENJRE_VERSION
FROM sapvs/openjre-alpine:${OPENJRE_VERSION}

ARG CASSANDRA_VERSION
WORKDIR /

ADD https://downloads.apache.org/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz /

RUN tar -xzf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
  && mv apache-cassandra-${CASSANDRA_VERSION} cassandra \
  && chown -R java:java /cassandra

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160

USER java
CMD [ "/cassandra/bin/cassandra", "-f"]
