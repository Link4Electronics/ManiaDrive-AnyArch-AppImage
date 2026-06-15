#!/bin/sh

set -eu

ARCH=$(uname -m)

case "$ARCH" in
	x86_64|aarch64|armv7h|powerpc64|ppc64|powerpc|ppc|powerpc64le|ppc64le|riscv|pentium4|i686)
		echo "Installing Arch package dependencies..."
		echo "---------------------------------------------------------------"
		pacman -Syu --noconfirm base-devel cmake mesa glu glew openal freealut libjpeg-turbo libpng zlib curl libxml2 libvorbis libogg libx11 libxinerama v4l-utils bison

		#echo "Installing debloated packages..."
		#echo "---------------------------------------------------------------"
		#get-debloated-pkgs --add-common --prefer-nano

		# Comment this out if you need an AUR package
		#make-aur-package PACKAGENAME
		;;
	*)
		echo "Installing Alpine package dependencies..."
		echo "---------------------------------------------------------------"
		# apk add --no-cache PACKAGESHERE
		;;
esac

# If the application needs to be manually built that has to be done down here

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
mkdir -p ./AppDir/bin
git clone https://github.com/Link4Electronics/ManiaDrive
cd ManiaDrive
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build .
mv -v level_editor mania_drive libraydium.so ode-build/libode.so.0.16.5 php-build/libs/libphp5.so ../*.php ../../AppDir/bin
