FROM builder:linux-arm

ARG NERVA_VERSION
ARG BUILD_ARCH

COPY /nerva/ /opt/toolchain/nerva/

RUN /opt/toolchain/configure ${BUILD_ARCH} && \
	/opt/toolchain/build nerva && \
	/opt/toolchain/build package ${NERVA_VERSION}
