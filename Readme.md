## Install kubeadmin with vagrant

make up

### Manual configuration

```
kubectl apply -f https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')
kubectl taint nodes --all node-role.kubernetes.io/master-
```

## Resources

[Kubernetes in Vagrant with kubeadm](https://medium.com/@lizrice/kubernetes-in-vagrant-with-kubeadm-21979ded6c63)

## Networks information

master: 192.168.205.10
node1: 192.168.205.11

API k8s: 10.0.2.15:6443

## Resources

- https://medium.com/@joatmon08/playing-with-kubeadm-in-vagrant-machines-36598b5e8408
- https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/
- https://michele.sciabarra.com/2018/02/12/devops/Kubernetes-with-KubeAdm-Ansible-Vagrant/
