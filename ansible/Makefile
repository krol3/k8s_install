up:
	vagrant up

down:
	vagrant halt

provision:
	vagrant provision

destroy-all:
	for i in `vagrant global-status | grep virtualbox | awk '{ print $1 }'` ; do vagrant destroy $i ; done