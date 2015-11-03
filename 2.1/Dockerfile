FROM baselibrary/ubuntu:14.04
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV ETCD_MAJOR 2.0
ENV ETCD_VERSIONS 2.2.1

## Packages
RUN \
  curl -fsSL "https://github.com/coreos/etcd/releases/download/v${ETCD_VERSIONS}/etcd-v${ETCD_VERSIONS}-linux-amd64.tar.gz" | tar -zxvf - --strip-components=1 --exclude=Documentation -C /usr/bin/

## Environments
ENV ETCD_DATA_DIR /var/lib/etcd

## Scripts
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x            /docker-entrypoint.sh

EXPOSE 4001 7001 2379 2380

VOLUME ["${ETCD_DATA_DIR}"]

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]

CMD ["etcd"]


