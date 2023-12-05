# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
 
  config.vm.box = "ubuntu/jammy64"

  config.vm.box_check_update = true

  config.vm.provision "shell", inline: <<-SHELL
    wget https://apt.puppet.com/puppet8-release-jammy.deb
    dpkg -i puppet8-release-jammy.deb
    rm -f puppet8-release-jammy.deb
    apt update
    
    apt-get install -y vim tree puppet-agent
    
    source /etc/profile.d/puppet-agent.sh
    ln -s /opt/puppetlabs/puppet/bin/puppet /bin/puppet

    puppet --version
    puppet apply -e 'notify { "hello world": }'
  SHELL

  config.vm.provision "file", source: "./puppet", destination: "$HOME/puppet"
end
