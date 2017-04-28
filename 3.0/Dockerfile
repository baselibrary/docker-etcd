FROM baselibrary/baseimage:2.0.0
MAINTAINER ShawnMa <qsma@thoughtworks.com>

## Version
ENV ETCD_MAJOR   3.0
ENV ETCD_RELEASE 3.0.9

## Packages
RUN \
  curl -fsSL "https://github.com/coreos/etcd/releases/download/v3.0.9/etcd-v3.0.9-linux-amd64.tar.gz" | tar -zxvf - --strip-components=1 -C /usr/bin/ etcd-v3.0.9-linux-amd64/etcd etcd-v3.0.9-linux-amd64/etcdctl

## Environments
ENV ETCD_DATA_DIR /var/lib/etcd

## Scripts
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x            /docker-entrypoint.sh

EXPOSE 4001 7001 2379 2380

VOLUME ["${ETCD_DATA_DIR}"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["etcd"]
