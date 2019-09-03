#!/bin/bash

kubeadm reset
TOKEN=`kubeadm token create --print-join-command`
TOKEN_CERT=
eval "echo $TOKEN"
#kubeadm join --skip-phases=preflight --token $TOKEN --discovery-token-unsafe-skip-ca-verification 10.0.2.15:6443