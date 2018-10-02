FROM ubuntu:18.04
RUN apt update && apt upgrade --yes
RUN apt install --no-install-recommends --yes \
	nano python zip unzip tar xz-utils ca-certificates cmake g++ make pkg-config \
	graphviz doxygen git curl libtool-bin libcurl4-openssl-dev \
	autoconf automake

COPY /toolchains-android /opt/toolchain/
COPY /.dl-cache/ /opt/toolchain/.dl-cache/
COPY /.ext-packed/ /opt/toolchain/.ext-packed/

RUN /opt/toolchain/configure arm64v8a && \
	/opt/toolchain/build environment

RUN /opt/toolchain/configure armv7 && \
	/opt/toolchain/build environment

RUN rm -rf /opt/toolchain/libs/build
