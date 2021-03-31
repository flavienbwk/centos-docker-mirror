#!/bin/sh

set -ex

version="7"
src=https://download.docker.com/linux/centos
dest=/downloads

# Download gpg key
wget -v "$src/gpg" -P "$dest"

# Download mirror
for arch in "x86_64"
do
	arch_src="$src/$version/$arch"
	arch_dest="$dest"
	mkdir -p "$arch_dest"
	wget \
		--mirror -nH --no-check-certificate --cut-dirs=1 --convert-links --adjust-extension --page-requisites --no-parent \
		"$arch_src" -P "$arch_dest"
done