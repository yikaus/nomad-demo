sudo mv /tmp/consulconfig /etc/consul
sudo mv /tmp/nomadconfig /etc/nomad
sudo systemctl enable consul.service nomad.service
sudo systemctl start consul.service nomad.service
echo "export NOMAD_ADDR=http://192.168.0.20:4646" >> /home/vagrant/.profile