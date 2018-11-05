# Builder

This repo is a docker based build system for linux, allowing the compilation of nerva for virtually any linux distribution  
as well as static builds for Linux x64 and Android.

## Supported Versions

This toochain is only tested on Ubuntu 18.04. No support is provided for any other distro, however theoretically any version of Linux that can run docker can run this repo 
This toolchain produces binaries targeting:  

Linux x64:
- Any x64 Linux distro with libc >= 2.24 (untested but should work)

Android
- armeabi-v7a: Android API level 19 (KitKat 4.4+) (No hardware AES)
- arm64-v8a: Android API level 24 (Nougat 7.0+) (Hardware AES)

Support is also underway for

- Linux ARM

## Dependencies

The build system includes archives of the following dependencies:
- zmq 4.3.1
- cppzmq 4.3.0
- openssl 1.0.2j
- zlib 1.2.11
- libsodium 1.0.16

It also downloads the following dependencies:
- Android NDK r17c
- Boost 1.68

## Pre-compiled

You can get precompiled android binaries from  
https://getnerva.org/#downloads

## Building Binaries

The builder is capable of statically linked builds for linux and android as well as dynamically linked builds for linux

### Building a static binary (recommended)

`./build static <OS> <VERSION>`

Where `<OS>` is the operating system you wish to target:  
- linux  
- android  

Where `<VERSION>` is the OS version to target  
- Linux: x64
- Android: armv7, arm64v8a

Currently available build configurations are:
- `build static linux x64`
- `build static android armv7`
- `build static android arm64v8a`

### Building a dynamic binary (Linux x64 only)

`./build dynamic <DISTRO> <VERSION>`

Where `<DISTRO>` is the linux distribution you wish to target:  
- Ubuntu  
- Fedora  
- Debian  

Where `<VERSION>` is the DISTRO version to target  
- Ubuntu: 16.04, 17.10, 18.04
- Fedora: 26, 27, 28, 29
- Debian: stable, testing, unstable

Example:  
- `./build dynamic ubuntu 18.04`

Other combinations have not been tested. Also the same effect can be achieved without this repo.  
Simply downloaqd the source code and execute the build script for your OS

`git clone --recursive https://bitbucket.org/nerva-project/nerva && ./nerva/builder/linux`

## Additional: Running the CLI on Android

You need an Android terminal emulator to use this build.  
The precompiled binaries have been tested using [Termux](https://play.google.com/store/apps/details?id=com.termux)  
Install termux then use it to download, unzip and run nerva.

`curl -O https://getnerva.org/content/binaries/nerva-v0.x.x.x_android-arm64v8a.zip`  
`unzip nerva-v0.x.x.x_android-arm64v8a.zip`  
`./nervad` 
