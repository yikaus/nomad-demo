# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "debian/jessie64"

  config.vm.box_check_update = false

  config.vm.provision :file do |file|
    file.source = "config/consul.service"
    file.destination = "/tmp/consul.service"
  end
  
  config.vm.provision :file do |file|
    file.source = "config/nomad.service"
    file.destination = "/tmp/nomad.service"
  end
  
  config.vm.define :docker1 do |docker1|
    docker1.vm.hostname = "docker1"
    docker1.vm.network "private_network", ip: "192.168.0.20"
    docker1.vm.provision :file do |consulconfig|
      consulconfig.source = "config/docker1consul"
      consulconfig.destination = "/tmp/consulconfig"
    end
    docker1.vm.provision :file do |nomadconfig|
      nomadconfig.source = "config/docker1nomad"
      nomadconfig.destination = "/tmp/nomadconfig"
    end
    docker1.vm.provision  "shell", path: "nomad_setup.sh" 
  end

  config.vm.define :docker2 do |docker2|
    docker2.vm.hostname = "docker2"
    docker2.vm.network "private_network", ip: "192.168.0.21"
    docker2.vm.provision :file do |consulconfig|
      consulconfig.source = "config/docker2consul"
      consulconfig.destination = "/tmp/consulconfig"
    end
    docker2.vm.provision :file do |nomadconfig|
      nomadconfig.source = "config/docker2nomad"
      nomadconfig.destination = "/tmp/nomadconfig"
    end
    docker2.vm.provision  "shell", path: "nomad_setup.sh" 
  end
  
  config.vm.define :docker3 do |docker3|
    docker3.vm.hostname = "docker3"
    docker3.vm.network "private_network", ip: "192.168.0.22"
    docker3.vm.provision :file do |consulconfig|
      consulconfig.source = "config/docker3consul"
      consulconfig.destination = "/tmp/consulconfig"
    end
    docker3.vm.provision :file do |nomadconfig|
      nomadconfig.source = "config/docker3nomad"
      nomadconfig.destination = "/tmp/nomadconfig"
    end
    docker3.vm.provision  "shell", path: "nomad_setup.sh"
  end

  config.vm.provision  "shell", path: "vagrant_build.sh"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "768"
  end

end
