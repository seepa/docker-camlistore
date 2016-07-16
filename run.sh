#!/bin/sh

die () {
  echo >&2 "$@"
  exit 1
}

su - camlistore -c "/usr/local/bin/camlistored"
