# Kubernetes 🔥🔥🔥

## Tutorials

### Configuration

#### Configuring Redis using a ConfigMap

https://kubernetes.io/docs/tutorials/configuration/configure-redis-using-configmap/

- ConfigMap
- kubectl exec

### Stateless Applications

#### Exposing an External IP Address to Access an Application in a Cluster

https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/

- ReplicaSet
- kubectl expose deployment
- Service Type LoadBalancer

#### Example: Deploying PHP Guestbook application with Redis

https://kubernetes.io/docs/tutorials/stateless-application/guestbook/

- Redis backend
- PHP frontend
- kubectl port-forward
- Service Type LoadBalancer

### Stateful Applications

#### Example: Deploying WordPress and MySQL with Persistent Volumes

https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

- PersistentVolumeClaim and PersistentVolume
- Access by Service
- Service Type LoadBalancer
- kustomization.yaml
- Secret generator
- kubectl apply -k ./
- kubectl delete -k ./

## ETC

- How To Install Nginx on Ubuntu 20.04 | DigitalOcean
  https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
- Connecting Applications with Services | Kubernetes
  https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/
