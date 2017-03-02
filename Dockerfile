FROM golang:1.8-alpine
MAINTAINER theorician

ENV UID=991 GID=991

RUN apk update && apk add --no-cache git sqlite-dev su-exec

ADD build.sh /build.sh
RUN /build.sh

VOLUME ["/config", "/store"]

ADD run.sh /run.sh
CMD /run.sh
