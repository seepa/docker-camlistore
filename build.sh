#!/bin/sh

die () {
  echo >&2 "$@"
  exit 1
}

addgroup -g $PGID camlistore
adduser -u $PUID -G camlistore -D -s /bin/sh camlistore

apk add --no-cache gcc make

git clone https://github.com/camlistore/camlistore.git /tmp/camlistore
cd /tmp/camlistore
git checkout $CAMLISTORE_GIT_TAG
make
cp -r bin/* /usr/local/bin/
rm /usr/local/bin/README
rm -rf /tmp/camlistore

rm /build.sh

apk del gcc make

ln -s /home/camlistore/var/camlistore /store
ln -s /home/camlistore/.config/camlistore /config