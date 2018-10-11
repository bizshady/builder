FROM ubuntu:18.04
RUN apt update && apt upgrade --yes
RUN apt install --no-install-recommends --yes \
	nano zip unzip tar xz-utils ca-certificates cmake g++ make pkg-config \
	graphviz doxygen git curl libtool-bin autoconf automake mingw-w64 \
	g++-mingw-w64-x86-64 gcc-mingw-w64-x86-64 mingw-w64-x86-64-dev \
	g++-mingw-w64-i686 gcc-mingw-w64-i686 mingw-w64-i686-dev

COPY /toolchains/windows /opt/toolchain/
COPY /toolchains/.dl-cache/ /opt/toolchain/.dl-cache/
COPY /toolchains/.ext-packed/ /opt/toolchain/.ext-packed/

RUN /opt/toolchain/configure x64 && \
	/opt/toolchain/build environment

RUN rm -rf /opt/toolchain/libs/build
