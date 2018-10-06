# simplified-kubernetes

Simplified tutorial nodejs app with Kubernetes

## Prerequisites

1. Install kubectl (to interact with the cluster) for complete guide [here](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

```shell
    brew install kubernetes-cli
```

Get kubectl version
```shell
kubectl version
```

Get information about cluster with kubectl
```shell
kubectl cluster-info
```

2. Install Minikube
Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.
Minikube repository [here](https://github.com/kubernetes/minikube)

    * Before install minikube you need a Hypervisor installed can be VirtualBox, VMWare Fussion etc.

Installing minikube Mac Os
```shell
brew cask install minikube
```

Starting minikube
```shell
minikube start
```

After minikube success to start you can check cluster information by type
```shell
kubectl cluster-info
```

Get UI of Kubernetes dashboard
```shell
minikube dashboard
```

3. Make your terminal integrate with Minikube docker registry
```shell
eval $(minikube docker-env)
```

4. Build docker images
```
docker build -t simplified-kubernetes:v1 .
```

5. Check the images in Minikube's docker registry
```
minikube ssh docker images 
```

6. Create deployment 
A Kubernetes Pod is a group of one or more Containers, tied together for the purposes of administration and networking. Use the <b> kubectl run </b> command to create a Deployment that manages a Pod.

```shell
kubectl run simplified-kubernetes --image=simplified-kubernetes:v1 --port=5000 --image-pull-policy=Never
```

Get deployment detail:
```shell
kubectl get deployments
```

Get pods:
```
kubectl get pods
```

7. Create service
By default, the Pod is only accessible by its internal IP address within the Kubernetes cluster. To make the <b>simplified-kubernetes</b> Container accessible from outside the Kubernetes virtual network, you have to expose the Pod as a Kubernetes Service.

```shell
kubectl expose deployment simplified-kubernetes --type=LoadBalancer
```

Get service list
```shell
kubectl get services
```

Access simplified-kubernetes service and open to the browser
```shell
minikube service simplified-kubernetes
```

## Clean up
```shell
kubectl delete service simplified-kubernetes
kubectl delete deployment simplified-kubernetes
```

Remove docker images in Minikube's docker registry
```shell
docker rmi simplified-kubernetes:v1 -f
```

Stop minikube VM
```shell
minikube stop
eval $(minikube docker-env -u)
```

Delete minikube VM
```shell
minikube delete
```