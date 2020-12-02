#!/bin/bash

yum install -q -y sshpass >/dev/null 2>&1
sshpass -p "kubernetes" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no master.k8s.com:/joincluster.sh /joincluster.sh 2>/dev/null
bash /joincluster.sh >/dev/null 2>&1