#!/bin/bash
kubectl get secrets --all-namespaces -o json | jq -r '.items[] | select (.type=="kubernetes.io/tls") \
| .metadata.name+"-"+(.data["tls.crt"] | @base64d | openssl x509 -noout -enddate)'