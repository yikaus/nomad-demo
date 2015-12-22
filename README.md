## Quick demo for Nomad and Consul

This demo to quickly show you how to use nomad and consul setup a docker scheduler across cluster host as well as docker service discovery

#### Bootstrap 
$ vagrant up


#### Fire up a Job
$ vagrant ssh docker1

vagrant@docker1:~$ cd /vagrant

agrant@docker1:/vagrant$ nomad run example.nomad


#### View nodes & service in consul 
http://192.168.0.20:8500

#### Nomad & Consul server setup 
3 VMs : Docker1 Docker2 Docker3

Docker1 :  Nomad & Consul server as well as client

Docker2 :  Nomad & Consul client 

Docker1 :  Nomad & Consul client

###### beer!