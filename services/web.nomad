job "web" {
	region = "au"
	datacenters = ["dc1"]
	type = "service"
	update {
		stagger = "10s"
		max_parallel = 1
	}
	group "web" {
		count = 2
		restart {
			interval = "5m"
			attempts = 10
			delay = "25s"
			mode = "delay"
		}
		task "nodejs" {
			driver = "docker"
			config {
				image = "yikaus/nomad-demo-web"
				labels = {
          connect.6379 = "cache-redis.service.consul"
        }
				port_map {
					http = 3000
				}
				dns_servers = ["8.8.8.8", "172.17.0.1"]
			}
			service {
				name = "${TASKGROUP}-nodejs"
				tags = ["global", "web"]
				port = "http"
				check {
					name = "alive"
					type = "tcp"
					interval = "10s"
					timeout = "2s"
				}
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