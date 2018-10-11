FROM builder:android

ARG NERVA_VERSION
ARG BUILD_ARCH

COPY /src/nerva/ /opt/toolchain/nerva/

RUN /opt/toolchain/configure ${BUILD_ARCH} && \
	/opt/toolchain/build nerva && \
	/opt/toolchain/build package ${NERVA_VERSION}
