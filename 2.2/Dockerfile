FROM baselibrary/baseimage:1.0.0
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV ETCD_MAJOR   2.2
ENV ETCD_RELEASE 2.2.1

## Packages
RUN \
  curl -fsSL "https://github.com/coreos/etcd/releases/download/v2.2.1/etcd-v2.2.1-linux-amd64.tar.gz" | tar -zxvf - --strip-components=1 -C /usr/bin/ etcd-v2.2.1-linux-amd64/etcd etcd-v2.2.1-linux-amd64/etcdctl

## Environments
ENV ETCD_DATA_DIR /var/lib/etcd

## Scripts
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x            /docker-entrypoint.sh

EXPOSE 4001 7001 2379 2380

VOLUME ["${ETCD_DATA_DIR}"]

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]

CMD ["etcd"]


