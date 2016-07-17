#!/bin/sh

die () {
  echo >&2 "$@"
  exit 1
}

PUID=${PUID:-3060}
PGID=${PGID:-3060}

id camlistore 2>/dev/null
[ ! $? -eq 0 ] && addgroup -g $PGID camlistore && adduser -u $PUID -G camlistore -D -s /bin/sh camlistore

if [ ! "$(id -u camlistore)" -eq "$PUID" ]; then usermod -o -u "$PUID" camlistore ; fi
if [ ! "$(id -g camlistore)" -eq "$PGID" ]; then groupmod -o -g "$PGID" camlistore ; fi

su - camlistore -c "/usr/local/bin/camlistored"
