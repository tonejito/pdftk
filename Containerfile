FROM debian:11-slim AS base

ENV DEBIAN_FRONTEND=noninteractive \
    APT_OPTS="-q=2 --assume-yes --no-install-recommends --no-install-suggests"

COPY apt.conf /etc/apt/apt.conf.d/99-local

RUN apt ${APT_OPTS} update && \
    apt ${APT_OPTS} install pdftk poppler-utils && \
    rm -rf    /var/lib/apt/lists /var/cache/apt/archives /usr/share/doc && \
    mkdir -vp /var/lib/apt/lists /var/cache/apt/archives /usr/share/doc && \
    install --verbose --owner root --group root --mode 0640 /dev/null   /var/lib/apt/lists/lock && \
    install --verbose --owner root --group root --mode 0700 --directory /var/lib/apt/lists/partial && \
    install --verbose --owner root --group root --mode 0640 /dev/null   /var/cache/apt/archives/lock && \
    install --verbose --owner root --group root --mode 0700 --directory /var/cache/apt/archives/partial && \
    date '+%s'

WORKDIR /opt

CMD pdftk
