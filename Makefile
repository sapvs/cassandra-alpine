# For local builds these versions are supplied here, else github actions takes care of this.
OPENJRE_VERSIONS=8-latest 11-latest 17-latest
# for 8 minimal jre is 8-jre-base and is headless for 11 onwards
CASSANDRA_VERSIONS=3.0.25 3.11.11 4.0.1

images:
	@for openjre in ${OPENJRE_VERSIONS}; do\
		for jre in ${JRE_VERSIONS}; do\
			docker build \
			--build-arg openjreNE_VERSION=$$openjre \
			--build-arg JRE_VERSION=$$jre \
			-t sapvs/openjre-openjrene:$$jre-$$openjre .;\
		done;\
	done

# TODOL Check java version, and other checks
test: images
	@for openjre in ${OPENJRE_VERSIONS}; do\
		for jre in ${JRE_VERSIONS}; do\
			docker run --rm sudosapan/openjre-openjrene:$$jre-$$openjre;\
		done;\
	done
