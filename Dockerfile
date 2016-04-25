FROM alpine
MAINTAINER Kyne Huang <kyne.huang@hujiang.com>
ENV REFRESHED_AT 2015-12-28

RUN  apk add --update unzip curl bash

ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/sbin && unzip /tmp/consul.zip && chmod +x /usr/sbin/consul && rm /tmp/consul.zip
ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip /tmp/webui.zip
RUN mkdir -p /webui
RUN cd /webui/ && unzip /tmp/webui.zip

ADD config/consul_base.json /config/

EXPOSE 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500

VOLUME ["/data","/config"]
ENTRYPOINT [ "/usr/sbin/consul", "agent", "-config-dir=/config" ]
CMD []
