FROM alpine:edge
MAINTAINER Charlie Wang <272876047@qq.com>

RUN apk add --update openssh util-linux dbus ttf-freefont xauth xf86-input-keyboard sudo\
    && rm  -rf /tmp/* /var/cache/apk/*
RUN addgroup alpine \
&& adduser  -G alpine -s /bin/sh -D alpine \
&& echo "alpine:alpine" | /usr/sbin/chpasswd \
&& echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers

ADD docker-entrypoint.sh /usr/sbin
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
