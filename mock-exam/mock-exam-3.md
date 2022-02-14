# Mock Exam 3

## Question. 1

Create a new service account with the name `pvviewer`.
Grant this Service account access to `list` all PersistentVolumes in the cluster
by creating an appropriate cluster role called `pvviewer-role` and ClusterRoleBinding called `pvviewer-role-binding`.
Next, create a pod called `pvviewer` with the image: `redis` and serviceAccount: `pvviewer` in the default namespace.

## Solution

Reference: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/

```bash
kubectl create serviceaccount pvviewer
kubectl create clusterrole pvviewer-role --resource=persistentvolumes --verb=list
kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default:pvviewer
```

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: pvviewer
  name: pvviewer
spec:
  containers:
    - image: redis
      name: pvviewer
  # Add service account name
  serviceAccountName: pvviewer
```

## Question. 2

List the `InternalIP` of all nodes of the cluster.
Save the result to a file `/root/CKA/node_ips`.

Answer should be in the format: `InternalIP of controlplane`<space>`InternalIP of node01` (in a single line)

## Solution

```
kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' > /root/CKA/node_ips
```

## Question. 3

Create a pod called `multi-pod` with two containers.

Container 1, name: `alpha`, image: `nginx`

Container 2: name: `beta`, image: `busybox`, command: `sleep 4800`

Environment Variables:

container 1:

`name: alpha`

Container 2:

`name: beta`

## Solution

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: multi-pod
spec:
  containers:
    - image: nginx
      name: alpha
      env:
        - name: name
          value: alpha
    - image: busybox
      name: beta
      command: ["sleep", "4800"]
      env:
        - name: name
          value: beta
```

## Question. 4

Create a Pod called `non-root-pod`, image: `redis:alpine`

runAsUser: 1000

fsGroup: 2000

## Solution

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: non-root-pod
spec:
  securityContext:
    runAsUser: 1000
    fsGroup: 2000
  containers:
    - name: non-root-pod
      image: redis:alpine
```

## Question. 5

We have deployed a new pod called `np-test-1` and a service called `np-test-service`.
Incoming connections to this service are not working.
Troubleshoot and fix it.
Create NetworkPolicy, by the name `ingress-to-nptest` that allows incoming connections to the service over port `80`.

Important: Don't delete any current objects deployed.

## Solution

```yaml
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: ingress-to-nptest
  namespace: default
spec:
  podSelector:
    matchLabels:
      run: np-test-1
  policyTypes:
    - Ingress
  ingress:
    - ports:
        - protocol: TCP
          port: 80
```

## Question. 6

Taint the worker node `node01` to be Unschedulable.
Once done, create a pod called `dev-redis`, image `redis:alpine`,
to ensure workloads are not scheduled to this worker node.
Finally, create a new pod called `prod-redis` and image: `redis:alpine` with toleration to be scheduled on `node01`.

key: `env_type`, value: `production`, operator: `Equal` and effect: `NoSchedule`

## Solution

```bash
kubectl taint node node01 env_type=production:NoSchedule
kubectl run dev-redis --image=redis:alpine
kubectl get pods -o wide
```

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: prod-redis
spec:
  containers:
    - name: prod-redis
      image: redis:alpine
  tolerations:
    - effect: NoSchedule
      key: env_type
      operator: Equal
      value: production
```

```bash
kubectl get pods -o wide | grep prod-redis
```

## Question. 7

Create a pod called `hr-pod` in `hr` namespace belonging to the `production` environment and `frontend` tier.

image: `redis:alpine`

Use appropriate labels and create all the required objects if it does not exist in the system already.

## Solution

```bash
kubectl create namespace hr
kubectl run hr-pod --image=redis:alpine --namespace=hr --labels=environment=production,tier=frontend
```

## Question. 8

A kubeconfig file called `super.kubeconfig` has been created under `/root/CKA`.
There is something wrong with the configuration.
Troubleshoot and fix it.

## Solution

server: https://controlplane:9999 -> server: https://controlplane:6443

```bash
kubectl cluster-info --kubeconfig=/root/CKA/super.kubeconfig
```

## Question. 9

We have created a new deployment called `nginx-deploy`.
scale the deployment to 3 replicas.
Has the replica's increased?
Troubleshoot the issue and fix it.

## Solution

```bash
kubectl scale deploy nginx-deploy --replicas=3
kubectl get pods -n kube-system

sed -i 's/kube-contro1ler-manager/kube-controller-manager/g' /etc/kubernetes/manifests/kube-controller-manager.yaml

kubectl get deployments.apps
```
