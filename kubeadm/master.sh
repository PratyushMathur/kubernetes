#!/bin/bash

# Initialize Kubernetes
kubeadm init --apiserver-advertise-address=10.0.0.10 --pod-network-cidr=192.168.0.0/16 >> /root/kubeinit.log 2>/dev/null

# Copy Kube admin config
mkdir /home/vagrant/.kube
cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube

# Deploy weave network
su - vagrant -c "kubectl apply -f https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# Generate Cluster join command
kubeadm token create --print-join-command > /joincluster.sh