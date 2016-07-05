#!/bin/bash

[[ -f /etc/haproxy/haproxy.cfg ]] && rm /etc/haproxy/haproxy.cfg

/consul-template -config /haproxy_consul.cfg