FROM ubuntu:18.04
RUN apt update && apt upgrade --yes
RUN apt install --no-install-recommends --yes \
	nano python zip unzip tar xz-utils ca-certificates cmake g++ make pkg-config \
	graphviz doxygen git curl libtool-bin \
	autoconf automake

COPY /toolchains/android /opt/toolchain/
COPY /toolchains/.dl-cache/ /opt/toolchain/.dl-cache/
COPY /toolchains/.ext-packed/ /opt/toolchain/.ext-packed/
COPY /src/nerva/ /opt/toolchain/nerva/

ARG NERVA_VERSION
ARG BUILD_ARCH

RUN /opt/toolchain/configure ${BUILD_ARCH} && \
	/opt/toolchain/build environment && \
	rm -rf /opt/toolchain/libs/build
