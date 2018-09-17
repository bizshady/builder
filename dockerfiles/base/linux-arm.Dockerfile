FROM debian:stable
RUN apt update && apt upgrade --yes
RUN apt install --no-install-recommends --yes \
	nano zip unzip tar xz-utils ca-certificates cmake g++ make pkg-config \
	graphviz doxygen git curl libtool-bin autoconf automake mingw-w64 \
	g++-aarch64-linux-gnu gcc-aarch64-linux-gnu cpp-aarch64-linux-gnu \
	g++-arm-linux-gnueabi gcc-arm-linux-gnueabi cpp-arm-linux-gnueabi \
	g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf cpp-arm-linux-gnueabihf

COPY /toolchains-linux-arm /opt/toolchain/
COPY /.dl-cache/ /opt/toolchain/.dl-cache/
COPY /.ext-packed/ /opt/toolchain/.ext-packed/

RUN /opt/toolchain/configure aarch64 && \
	/opt/toolchain/build environment

#RUN /opt/toolchain/configure armeabi && \
#	/opt/toolchain/build environment

#RUN /opt/toolchain/configure armeabihf && \
#	/opt/toolchain/build environment
