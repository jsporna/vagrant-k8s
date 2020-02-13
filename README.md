# vagrant-k8s

Kubernetes local stack based on CentOS 7 build with Vagrant and Ansible on VirtualBox VMs

## Motivation

Run local stack of kubernetes for testing multi node network policies.
Kubernetes nodes are hardened using ansible role based on [RedHatOfficial.rhel7_ospp](https://galaxy.ansible.com/RedHatOfficial/rhel7_ospp) Ansible Galaxy Role.
Ansible role to prepare system for kubernetes is based on:
* [Kubernetes Setup Using Ansible and Vagrant](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/), 
* [Kubernetes Documentation - Container runtimes](https://kubernetes.io/docs/setup/production-environment/container-runtimes/),
* [Kubernetes on CentOS 7 with Firewalld](https://medium.com/platformer-blog/kubernetes-on-centos-7-with-firewalld-e7b53c1316af),


## Prerequisites

One need to have:
* Hashicorp Vagrant - https://www.vagrantup.com/downloads.html
* Oracle VirtualBox - https://www.virtualbox.org/wiki/Downloads
* RedHat Ansible - https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Optional:
* GNU Make - https://www.gnu.org/software/make/

## How to use

### Run 
To run kubernetes cluster:

```bash
vagrant up
```

There will be created 2 VMs: *k8s-master-1*, *k8s-node-1*

### Access
Access to VMs:

```bash
vagrant ssh <VM-name>
```

### Access using kubeclt
There will be fetched kube config file in path `ansible/.kube/config`

```bash
export KUBECONFIG=$(pwd)/ansible/.kube/config
kubectl get nodes
kubectl get pods -n kube-system
```

### Stop
To stop cluster's VMs:

```bash
vagrant halt
```

### Destroy
To destroy VMs:

```bash
vagrant destroy
```

or 

```bash
make clean
```

it will additionaly remove `.vagrant` folder, `ansible/join-command` & `ansible/.kube/config` files




