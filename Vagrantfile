WORKER_NODES=1

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus   = 2
    end

    (1..1).each do |i|
        config.vm.define "k8s-master-#{i}" do |master|
            master.vm.box = "centos/7"
            master.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            master.vm.hostname = "k8s-master-#{i}"
            master.vm.provision "ansible" do |ansible|
                ansible.playbook = "ansible/master-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "192.168.50.#{i + 10}",
                    node_name: "k8s-master-#{i}"
                }
            end
        end
    end

    (1..WORKER_NODES).each do |i|
        config.vm.define "k8s-node-#{i}" do |node|
            node.vm.box = "centos/7"
            node.vm.network "private_network", ip: "192.168.50.#{i + 20}"
            node.vm.hostname = "k8s-node-#{i}"
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "ansible/worker-playbook.yml"
                ansible.extra_vars = {
                    node_ip: "192.168.50.#{i + 20}",
                    node_name: "k8s-node-#{i}"
                }
            end
        end
    end
end
