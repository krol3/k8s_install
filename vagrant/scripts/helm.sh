# Install Helm v2.14.0
if ! which helm > /dev/null; then
  echo "Command not found! Install? (y/n) \c"
  HELM_TAR=helm-v2.11.0-linux-amd64.tar.gz
  wget https://get.helm.sh/${HELM_TAR}
  tar -zxvf ${HELM_TAR}
  mv linux-amd64/helm /usr/local/bin/helm
fi

## helm rbac
kubectl create -f rbac-config.yaml
helm init --service-account tiller --history-max 10 --upgrade