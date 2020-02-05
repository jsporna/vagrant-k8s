Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus   = 2
    end

    (1..3).each do |i|
        config.vm.define "k8s-master-#{i}" do |master|
            master.vm.box = "centos/7"
            master.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            master.vm.hostname = "k8s-master-#{i}"
            master.vm.provision "ansible" do |ansible|
                ansible.playbook = "ansible/master-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "10.100.10.#{i + 10}"
                }
            end
        end
    end
end
