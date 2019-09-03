#!/bin/bash

#clean
kubeadm reset
rm -r /home/vagrant/.kube
systemctl daemon-reload
systemctl restart kubelet

# Initializing your master
NODENAME=$(hostname -s)
# Get the IP address that VirtualBox has given this VM
IP_ADDR=`ifconfig enp0s8 | grep -i Mask | awk '{print $2}'| cut -f2 -d:`
kubeadm init --apiserver-advertise-address $IP_ADDR --apiserver-cert-extra-sans=$IP_ADDR  --node-name $NODENAME --pod-network-cidr=192.168.0.0/16

# Set up admin creds for the vagrant user
sudo --user=vagrant mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config

#  Install network
# kubectl get nodes
# kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml