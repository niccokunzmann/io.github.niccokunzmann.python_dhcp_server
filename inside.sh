#!/bin/sh

##
## Run inside the flatpak build and move all files to their locations.
##

set -e
cd "`dirname \"$0\"`"

ID=io.github.niccokunzmann.python_dhcp_server

echo Install metadata
## see https://docs.flatpak.org/en/latest/conventions.html#metainfo-files
## see https://docs.flathub.org/docs/for-app-authors/metainfo-guidelines/#path-and-filename

mkdir -p files/share/app-info
cp flatpak/$ID.xml files/share/app-info/
mkdir -p /app/share/metainfo/
cp flatpak/$ID.xml /app/share/metainfo/


echo Install Desktop file
## see https://docs.flatpak.org/en/latest/conventions.html#desktop-files

mkdir -p /app/share/applications/
cp flatpak/$ID.desktop /app/share/applications/


echo Install icons
## see https://docs.flatpak.org/en/latest/conventions.html#application-icons

for resolution in 128 256 512; do
  dir="/app/share/icons/hicolor/${resolution}x${resolution}/apps/"
  mkdir -p "$dir"
  cp images/icon/$ID-${resolution}x${resolution}.png "$dir/$ID.png"
done
mkdir -p /app/share/icons/hicolor/scalable/apps/
cp icon/$ID.svg /app/share/icons/hicolor/scalable/apps/$ID.svg


echo Install done
