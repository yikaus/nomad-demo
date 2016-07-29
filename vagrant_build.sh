export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -qq install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo debian-jessie main" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -qq install docker-engine

echo Fetching Nomad consul...
cd /tmp/
sudo curl -sSL https://releases.hashicorp.com/nomad/0.4.0/nomad_0.4.0_linux_amd64.zip -o nomad.zip
sudo curl -sSL https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip -o consul.zip
sudo curl -sSL https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip -o consul_ui.zip
echo Installing ...
sudo unzip nomad.zip -d /usr/bin
sudo unzip consul.zip -d /usr/bin
sudo mkdir -p /lib/consul/ui
sudo unzip consul_ui.zip -d /lib/consul/ui
sudo mv /tmp/*.service  /lib/systemd/system

sudo systemctl start docker
sudo gpasswd -a vagrant docker

sudo docker run -d --restart=always --dns '172.17.0.1' --name connectable -v /var/run/docker.sock:/var/run/docker.sock gliderlabs/connectable:master
