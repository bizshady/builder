FROM debian:stable
RUN apt update && apt upgrade --yes
RUN apt install --no-install-recommends --yes \
	nano zip unzip tar xz-utils ca-certificates cmake g++ make pkg-config \
	graphviz doxygen git curl libtool-bin autoconf automake mingw-w64 \
	g++-aarch64-linux-gnu gcc-aarch64-linux-gnu cpp-aarch64-linux-gnu \
	g++-arm-linux-gnueabi gcc-arm-linux-gnueabi cpp-arm-linux-gnueabi \
	g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf cpp-arm-linux-gnueabihf

COPY /toolchains/linux-arm /opt/toolchain/
COPY /toolchains/.dl-cache/ /opt/toolchain/.dl-cache/
COPY /toolchains/.ext-packed/ /opt/toolchain/.ext-packed/
COPY /src/nerva/ /opt/toolchain/nerva/

ARG NERVA_VERSION
ARG BUILD_ARCH

RUN /opt/toolchain/configure ${BUILD_ARCH} && \
	/opt/toolchain/build environment && \
	rm -rf /opt/toolchain/libs/build
