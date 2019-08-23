#!/bin/bash

kubeadm reset
TOKEN=`kubeadm token generate`
TOKEN_CERT=
kubeadm join --skip-phases=preflight --token $TOKEN --discovery-token-unsafe-skip-ca-verification 10.0.2.15:6443