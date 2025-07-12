Vagrant.configure("2") do |config|
  (1..2).each do |i|
    config.vm.define "debian#{i}" do |machine|
      machine.vm.box = "debian12"
      machine.vm.network "public_network", bridge: "enp2s0"
      machine.vm.network "forwarded_port", guest: 80, host: 8080 + i

      machine.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      end

      machine.vm.provision "shell", inline: <<-SHELL
        echo "Executando Ansible playbook dentro da VM..."

        # Forçar resolver DNS temporariamente
        echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf

        sudo apt update
      SHELL
    end
  end
end



#Vagrant.configure("2") do |config|
#    config.vm.box = "debian12"
#
#    config.vm.network "public_network", bridge: "enp2s0"
#    config.vm.network "forwarded_port", guest: 80, host: 8080
#
#    config.vm.provider "virtualbox" do |vb|
#        vb.memory = "2048"
#        vb.cpus = 2
#
#        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]    
#    end


    
