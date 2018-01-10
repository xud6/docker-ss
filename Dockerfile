FROM centos:7

RUN yum install wget && yum clean all
RUN wget https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo -O /etc/yum.repos.d/librehat-shadowsocks-epel-7.repo
RUN yum update && yum install shadowsocks-libev && yum clean all

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD    myPassword!
ENV TIMEOUT     60

EXPOSE $SERVER_PORT

CMD ss-server -s "$SERVER_ADDR" \
              -p "$SERVER_PORT" \
              -m "$METHOD"      \
              -k "$PASSWORD"    \
              "$EXTRA_OPTIONS"