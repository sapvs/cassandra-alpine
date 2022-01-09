# For local builds these versions are supplied here, else github actions takes care of this.
OPENJRE_VERSIONS=11-latest
# for 8 minimal jre is 8-jre-base and is headless for 11 onwards
CASSANDRA_VERSIONS=4.0.1

images:
	for openjre in ${OPENJRE_VERSIONS}; do\
		for cassa in ${CASSANDRA_VERSIONS}; do\
			docker build \
			--build-arg OPENJRE_VERSION=$$openjre \
			--build-arg CASSANDRA_VERSION=$$cassa \
			-t sapvs/cassandra-alpine:$$cassa-$$openjre .;\
		done;\
	done
