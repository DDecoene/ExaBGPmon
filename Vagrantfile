# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "exaBGPmon"
    #config.vm.box_url="https://github.com/DDecoene/ExaBGPmon/releases/download/v1.0/exaBGPmon.box"
    config.vm.box_url="file://exaBGPmon.box"
    #config.vm.box = "ubuntu/trusty64"

    config.vm.network "forwarded_port", guest: 5000, host: 5000
    config.vm.network "forwarded_port", guest: 27017, host: 27017

    config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.provision :shell, :path => "install.sh"
	config.vm.provision :shell, :path => "run_supervisor.sh", run: "always"
end
