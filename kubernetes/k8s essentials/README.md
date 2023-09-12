

# Componentes

## Control Planes

-  vai controlar os nodes
-  garantir saúde, capacidade e armazenar estado do cluster

#### ETCD

- banco do cluster
- guarda estado e informação do cluster
- ideal é ter replicas desse componente
- Portas: 2379-2380 --> tcp

#### Kube API Server

- Conversa com ETCD e com todo o cluster
- Centraliza comunicação
- Porta de comunicação entre nodes: 6443 --> tcp

#### Kube Scheduler

- Resposável por fazer o agendamento sobre criação e funcionamento do cluster
- Criação de novos containers etc
- Conversa com Kube API Server
- Porta: 10251 --> tcp

#### Kube Controller Manager

- Controlador da bagaça
- Conversa com Kube API Server
- Porta: 10252 -- tcp

## Workers

- os piões
- máquinas onde está rodando as apps
- todos os containers e pods executam aqui

#### Kubelet

- Agente que está rodando em cada nó
- Conversa com api server
- Porta: 10250 --> tcp

#### Kube proxy

- Todo node tem um desse
- Comunicação do node com o resto do mundo
- NodePort: 30000 - 32767 --> tcp
- WeaveNet: 6783-6784 --> tcp e udp

#### Pods

- um pod pode ter um ou mais container


#### ReplicaSet

- Garantir a quantidade de replica do meu deployment
- Garantir que todas as replicas estejam ok
- Faz controller dos pods
- Se morrem um node, cria outro

#### Deployment

- É o controller
- Ele quem cria replicas com as informações desejadas

#### Service

- São vários: Load balancer etc
- Tornar pods acessíveis para fora
- 



## Comandos

```
    k get pods -A  
    k apply -f pod.yaml 
    k get pods giropops -o yaml
    k delete pods giropops
    k run strigus --image nginx --port 80
    k get pods -o wide
    k get nodes
    k run -ti girus --image busybox
    k run -ti girus-1 --image alpine
    k attach girus-1 -c girus-1 -ti
    k exec -ti strigus -- bash
    k run -ti girus-1 --image alpine -o ymal
    k run -ti girus-1 --image alpine --dry-run=client -o yaml
    k delete -f pod-2.yaml 
    k apply -f pod-2.yaml 
    k get pods -w
    k describe pods girus
    k logs girus
    k logs girus -c apache
    k delete -f pod-2.yaml 
    k apply -f pod-2.yaml 
    k exec -ti giropups -- bash
```

## Referências

