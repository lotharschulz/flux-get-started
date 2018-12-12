#!/bin/bash
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

clear
echo "minikube status"
minikube status
sleep 1
echo -e "\n\n\nkubectl config current-context"
kubectl config current-context
echo -e "\n\n\n"
