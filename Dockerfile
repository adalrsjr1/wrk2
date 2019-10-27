FROM alpine:3.7

RUN apk --no-cache add --update \
    bash \
    git \
    openssh \
    build-base \
    luajit \
    openssl \
    openssl-dev

RUN git clone https://github.com/giltene/wrk2 && \
    cd wrk2 && \
    make

FROM alpine:3.7

RUN apk --no-cache add --update \
    luajit \
    openssl

COPY --from=0 /wrk2/wrk /usr/bin