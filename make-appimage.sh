#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=1.3custom
export ARCH VERSION
export OUTPATH=./dist
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export DESKTOP=https://raw.githubusercontent.com/Link4Electronics/ManiaDrive/refs/heads/main/debian/maniadrive.desktop
export ICON=https://raw.githubusercontent.com/Link4Electronics/ManiaDrive/refs/heads/main/debian/icon.png
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/*

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the test fails due to the app
# having issues running in the CI use --simple-test instead
quick-sharun --test ./dist/*.AppImage
