# Builder

This repo is a complete cross platform docker build system for linux. 
Currently android and linux binaries working fully, planned support for windows and linux-arm

## Supported Versions

This toochain is only tested on Ubuntu 17.10. No support is provided for any other distro, however theoretically any version of Linux that can run docker can run this repo  
This toolchain produces binaries targeting:  

Linux x64:
- Any x64 Linux distro with libc >= 2.24 (untested but should work)

Android
- armeabi-v7a: Android API level 19 (KitKat 4.4+) (No hardware AES)
- arm64-v8a: Android API level 24 (Nougat 7.0+) (Hardware AES)

Support is also underway for

- Windows x64
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

`./build make <OS> <VERSION>` 

Where `<OS>` is the operating system you wish to target:  
- linux  
- windows  
- android  
- linux-arm

Where `<VERSION>` is the OS version to target  
- Linux & Windows: x64
- Android: armv7, arm64v8a
- Linux-ARM: aarch64

Currently available build configurations are:
- `build make linux x64`
- `build make android armv7`
- `build make android arm64v8a`

Future options (Currently in progress):
- `build make windows x64`
- `build make linux-arm xxx`

## Additional: Running the CLI on Android

You need an Android terminal emulator to use this build.  
The precompiled binaries have been tested using [Termux](https://play.google.com/store/apps/details?id=com.termux)  
Install termux then use it to download, unzip and run nerva.

`curl -O https://getnerva.org/content/binaries/nerva-v0.1.3.5_android-arm64v8a.zip`  
`unzip nerva-v0.1.3.5_android-arm64v8a.zip`  
`./nervad` 