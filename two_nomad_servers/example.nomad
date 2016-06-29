job "example" {
	region = "au"
	datacenters = ["dc1"]
	type = "service"
	update {
		stagger = "10s"
		max_parallel = 1
	}
	group "cache" {
		count = 2
		restart {
			interval = "5m"
			attempts = 10
			delay = "25s"
			mode = "delay"
		}
		task "redis" {
			driver = "docker"
			config {
				image = "redis:latest"
				port_map {
					db = 6379
				}
			}
			service {
				name = "${TASKGROUP}-redis"
				tags = ["global", "cache"]
				port = "db"
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
					port "db" {
					}
				}
			}
		}
	}
}