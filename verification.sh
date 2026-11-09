#!/bin/bash
{
echo "== Tooling verification report: $(date) =="
echo "-- Host --"; lsb_release -d; free -h | sed -n 2p; df -h / | tail -1
echo "-- Versions --"
git --version
code --version | head -1
docker --version
docker compose version
minikube version | head -1
kubectl version --client
helm version --short
aws --version
az --version | head -1
node --version
jq --version
terraform --version | head -1
ansible --version | head -1
echo "-- Permissions --"
id -nG | grep -qw docker && echo "OK: user is in docker group" || echo "FAIL: not in docker group"
ls -l /var/run/docker.sock
docker ps >/dev/null 2>&1 && echo "OK: docker works without sudo" || echo "FAIL: docker needs sudo"
} 2>&1 | tee ~/report.txt
