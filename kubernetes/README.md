

## Pods

```
    kubectl get pods

    kubectl get pods --namespace=kube-system
    kubectl get pods --all-namespaces


```


````

    kubectl create -f <file_name>.yaml


    kubectl replace -f <file_name>.yaml

    kubectl scale --replicas=6 -f <file_name>.yaml

````


## Namespace

```
    kubectl config set-context $(kubectl config current-context) --namespace dev

```

