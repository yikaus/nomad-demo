FROM alpine:3.4

ENV CONSUL_TEMPLATE_VERSION=0.15.0

RUN apk update && \
    apk add libnl3 bash haproxy ca-certificates zip && \
    rm -rf /var/cache/apk/*

ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN unzip /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip  && \
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip


ADD haproxy.sh /haproxy.sh
ADD haproxy_consul.cfg /haproxy_consul.cfg
ADD haproxy.ctmpl /haproxy.ctmpl

CMD ["/haproxy.sh"]