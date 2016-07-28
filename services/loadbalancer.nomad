job "loadbalancer" {
	region = "au"
	datacenters = ["dc1"]
	type = "service"
	update {
		stagger = "10s"
		max_parallel = 1
	}
	group "lb" {
		count = 2
		restart {
			interval = "5m"
			attempts = 10
			delay = "25s"
			mode = "delay"
		}
		task "haproxy" {
			driver = "docker"
			config {
				image = "yikaus/nomad-demo-haproxy"
				network_mode = "host"
				port_map {
					http = 80
				}
			}
			service {
				name = "${TASKGROUP}-haproxy"
				tags = ["global", "lb"]
				port = "http"
				check {
					name = "alive"
					type = "tcp"
					interval = "10s"
					timeout = "2s"
				}
			}
			env {
				HAPROXY_DOMAIN = "192.168.0.20.xip.io"
				CONSUL_CONNECT = "127.0.0.1:8500"
      }
			resources {
				cpu = 500 # 500 Mhz
				memory = 128 # 128MB
				network {
					mbits = 10
					port "http" {
					}
				}
			}
		}
	}
}