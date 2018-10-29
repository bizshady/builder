FROM debian:stable
RUN apt update && apt upgrade --yes
RUN apt install --no-install-recommends --yes \
	nano zip unzip tar xz-utils cmake g++ make pkg-config \
	libtool-bin autoconf automake

COPY /toolchains/linux /opt/toolchain/
COPY /toolchains/.dl-cache/ /opt/toolchain/.dl-cache/
COPY /toolchains/.ext-packed/ /opt/toolchain/.ext-packed/

ARG NERVA_VERSION
ARG BUILD_ARCH

RUN /opt/toolchain/configure ${BUILD_ARCH} && \
	/opt/toolchain/build environment && \
	rm -rf /opt/toolchain/libs/build

COPY /src/nerva/ /opt/toolchain/nerva/
