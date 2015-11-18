# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.11.11"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end

  config.vm.synced_folder ".", "/vagrant/", mount_options: ["dmode=777", "fmode=777"]

  # Install Docker and support tools.
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&
    sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list &&
    sudo apt-get update &&
    sudo apt-get install -y linux-image-generic-lts-trusty docker-engine &&
    sudo curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose &&
    sudo chmod +x /usr/local/bin/docker-compose
  SHELL

  # Run the Docker containers
  config.vm.provision "shell", run: "always", inline: "cd /vagrant && docker-compose up -d"
end
