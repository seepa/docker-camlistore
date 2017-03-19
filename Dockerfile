FROM golang:1.8-alpine
MAINTAINER theorician

ENV UID=991 GID=991

RUN apk update && apk add --no-cache gcc libc-dev git sqlite-dev su-exec libjpeg-turbo-utils

ADD build.sh /build.sh
RUN /build.sh
RUN apk del gcc git

VOLUME ["/config", "/store"]


ADD run.sh /run.sh
CMD /run.sh
