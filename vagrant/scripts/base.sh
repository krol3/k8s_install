#!/bin/bash

echo Welcome to k8s settins ...

# Docker
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF
mkdir -p /etc/systemd/system/docker.service.d

# Install kubeadm
### https://kubernetes.io/docs/setup/independent/install-kubeadm/
echo install kubeadm ...

## 1) Install packages that allow apt to be used over HTTPS
apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent

# 2)  Kubelet will not start if the system has swap enabled, so we are disabling swap
### https://frankdenneman.nl/2018/11/15/kubernetes-swap-and-the-vmware-balloon-driver/
swapoff -a

# keep swap off after reboot
### https://gist.github.com/lizrice/69d3b28979391287176b3b7155a327b9
### https://medium.com/@wso2tech/multi-node-kubernetes-cluster-with-vagrant-virtualbox-and-kubeadm-9d3eaac28b98
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

## configuring Kubernetes to use the same CGroup driver as Docker
## IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd". https://kubernetes.io/docs/setup/cri/
## https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#configure-cgroup-driver-used-by-kubelet-on-master-node
sed -i '/ExecStart=/a Environment="KUBELET_EXTRA_ARGS=--cgroup-driver=cgroupfs"' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

# 3) Installing kubelet, kubeadm and kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl