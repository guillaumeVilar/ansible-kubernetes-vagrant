VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 
    config.vm.box = "geerlingguy/debian9"
    config.ssh.insert_key = false
    
    config.vm.provider :virtualbox do |v| 
        v.memory = 1024
        v.cpus = 1
        v.linked_clone = true
    end

    boxes = [
        { :name => "master.k8s.test", :ip => "192.168.84.2" },
        { :name => "node1.k8s.test", :ip => "192.168.84.3" },
        { :name => "node2.k8s.test", :ip => "192.168.84.4" },
    ]

    boxes.each do |opts|
        config.vm.define opts[:name] do |config|
            config.vm.hostname = opts[:name]
            config.vm.network :private_network, ip: opts[:ip]
            config.vm.provision 'shell', inline: 'echo "vagrant:vagrant" | chpasswd'
            config.vm.provision 'shell', inline: 'echo "root:root" | chpasswd'
            config.vm.provision "shell", inline: <<-SHELL
            sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
            systemctl restart sshd.service
            SHELL
        end
    end
end
