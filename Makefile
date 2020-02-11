.PHONY: cluster clean

cluster:
	vagrant up

clean:
	vagrant destroy -f
	rm -rf .vagrant
	rm -rf ansible/.kube
	rm -f  ansible/join-command
