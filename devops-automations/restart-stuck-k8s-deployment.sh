#!/bin/bash
echo "Checking for stuck deployments..."
kubectl get deployments --all-namespaces | grep -v "AVAILABLE" | awk '{print $2}' | \ 
xargs kubectl rollout restart deployment


