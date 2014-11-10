# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'ic-dev-box'

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder "c:/rails_projects", "/home/vagrant/projects"

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
  config.vm.provision :shell, path: 'userstrap.sh', keep_color: true, priv

  config.vm.provider :virtualbox do |vb|
  	vb.gui = true
  end
end
