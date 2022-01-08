ARG OPENJRE_VERSION
FROM sapvs/openjre-alpine:${OPENJRE_VERSION}

ARG CASSANDRA_VERSION
WORKDIR /

ADD https://downloads.apache.org/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz /

RUN tar -xzf apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
  && mv apache-cassandra-${CASSANDRA_VERSION} cassandra \
  && chown -R java:java /cassandra

USER java
CMD [ "/cassandra/bin/cassandra", "-f"]