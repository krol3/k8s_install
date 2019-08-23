## Install kubeadmin with vagrant

make up

### Manual configuration

```
kubectl apply -f https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')
kubectl taint nodes --all node-role.kubernetes.io/master-
```

## Resources

[Kubernetes in Vagrant with kubeadm](https://medium.com/@lizrice/kubernetes-in-vagrant-with-kubeadm-21979ded6c63)
