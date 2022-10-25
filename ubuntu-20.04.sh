#!/bin/bash
YQ_VERSION=v4.26.1
STERN_VERSION=1.11.0
HELM_VERSION=v2.17.0
KOPS_VERSION=1.12.1
KUBECTL_VERSION=v1.12.10
AUTO_SCALER_VERSION=1.12.10
AWS_PAGER=""

curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscli-exe-linux-x86_64.zip
unzip awscli-exe-linux-x86_64.zip
./aws/install
rm -rf aws awscli-exe-linux-x86_64.zip

#install kubectl on linux
#1) download kubectl binary
curl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
#2) copy kubectl binary to /usr/local/bin/kubectl
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#3) verify kubectl is installed
kubectl version --client
#4) install stern binary
curl https://github.com/wercker/stern/releases/download/${STERN_VERSION}/stern_linux_amd64
#5) copy stern binary to /usr/local/bin/stern
install -o root -g root -m 0755 stern_linux_amd64 /usr/local/bin/stern
#6) verify stern is installed
stern --version
#7) install yq
curl https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/bin/yq
chmod +x /usr/bin/yq
#8) install Kops
curl https://github.com/kubernetes/kops/releases/download/${KOPS_VERSION}/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 /usr/local/bin/kops
kops version
#9) install helm
curl https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz
tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && rm -rf linux-amd64 \
    && rm -rf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && helm version --client

#clean up
rm stern_linux_amd64
rm kubectl
rm -rf aws
rm awscli-exe-linux-x86_64.zip
