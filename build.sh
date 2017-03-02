#!/bin/sh

die () {
  echo >&2 "$@"
  exit 1
}

apk add --no-cache gcc

git clone https://github.com/camlistore/camlistore.git /tmp/camlistore
cd /tmp/camlistore
go run make.go
cp -r bin/* /usr/local/bin/
rm /usr/local/bin/README
rm -rf /tmp/camlistore

rm /build.sh

apk del gcc

ln -s /home/camlistore/var/camlistore /store
ln -s /home/camlistore/.config/camlistore /config
