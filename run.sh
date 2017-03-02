#!/bin/sh

id camlistore 2>/dev/null
if [ ! $? -eq 0 ]; then
	addgroup -g $GID camlistore
	adduser -u $UID -G camlistore -D -s /bin/sh camlistore
	chown -R camlistore:camlistore /home/camlistore
fi

exec su-exec $UID:$GID /usr/local/bin/camlistored
