#!/bin/sh

set -eu

ARCH=$(uname -m)

case "$ARCH" in
	x86_64|aarch64|armv7h|powerpc64|ppc64|powerpc|ppc|powerpc64le|ppc64le|riscv|pentium4|i686)
		echo "Installing Arch package dependencies..."
		echo "---------------------------------------------------------------"
		# pacman -Syu --noconfirm PACKAGESHERE

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
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
