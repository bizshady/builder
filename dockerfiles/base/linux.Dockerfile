FROM debian:stable
RUN apt update && apt upgrade --yes
RUN apt install --no-install-recommends --yes \
	nano zip unzip tar xz-utils ca-certificates cmake g++ make pkg-config \
	graphviz doxygen git libtool-bin \
	autoconf automake

COPY /toolchains/linux /opt/toolchain/
COPY /toolchains/.dl-cache/ /opt/toolchain/.dl-cache/
COPY /toolchains/.ext-packed/ /opt/toolchain/.ext-packed/

RUN /opt/toolchain/configure x64 && \
	/opt/toolchain/build environment

RUN rm -rf /opt/toolchain/libs/build
