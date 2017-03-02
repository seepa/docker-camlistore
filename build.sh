#!/bin/sh

git clone https://github.com/camlistore/camlistore.git /tmp/camlistore
cd /tmp/camlistore
go run make.go --sqlite=true
cp -r bin/* /usr/local/bin/
rm /usr/local/bin/README
rm -rf /tmp/camlistore
rm /build.sh

ln -s /home/camlistore/var/camlistore /store
ln -s /home/camlistore/.config/camlistore /config
