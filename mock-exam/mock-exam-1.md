# Mock Exam 1

Question. 1

Deploy a pod named `nginx-pod` using the `nginx:alpine` image.

Solution

```bash
kubectl run nginx-pod --image=nginx:alpine
```

Question. 2
Deploy a `messaging` pod using the `redis:alpine` image with the labels set to `tier=msg`.

Solution

```bash
kubectl run messaging --image=redis:alpine -l tier=msg
```

Question. 3
Create a namespace named `apx-x9984574`.

Solution

```bash
kubectl create namespace apx-x9984574
```

Question. 4
Get the list of nodes in JSON format and store it in a file at `/opt/outputs/nodes-z3444kd9.json`.

Solution

```bash
kubectl get nodes -o json > /opt/outputs/nodes-z3444kd9.json
```

Question. 5
Create a service `messaging-service` to expose the `messaging` application within the cluster on port `6379`.

Use imperative commands.

Solution

```bash
kubectl expose pod messaging --port=6379 --name messaging-service
```

Question. 6

Create a deployment named `hr-web-app` using the image `kodekloud/webapp-color` with `2` replicas.

Solution

```bash
kubectl create deployment hr-web-app --image=kodekloud/webapp-color --replicas=2
```

Question. 7

Create a static pod named `static-busybox` on the controlplane node that uses the `busybox` image and the command `sleep 1000`.

Solution

```bash
kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -oyaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: static-busybox
  name: static-busybox
spec:
  containers:
    - command:
        - sleep
        - "1000"
      image: busybox
      name: static-busybox
      resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Never
status: {}
```

Question. 8

Create a POD in the `finance` namespace named `temp-bus` with the image `redis:alpine`.

Solution

```bash
kubectl run temp-bus --image=redis:alpine --namespace=finance --restart=Never
```

Question. 9

A new application `orange` is deployed. There is something wrong with it. Identify and fix the issue.

Solution

```bash
$ kubectl describe pod orange
$ kubectl edit pod orange
$ kubectl replace -f /tmp/kubectl-edit-xxxx.yaml --force
```

Question. 10

Expose the `hr-web-app` as service `hr-web-app-service` application on port `30082` on the nodes on the cluster.

The web application listens on port `8080`.

Solution

```bash
kubectl expose deployment hr-web-app --type=NodePort --port=8080 --name=hr-web-app-service --dry-run=client -o yaml > hr-web-app-service.yaml
--port=30082 --target-port=8080
```

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: hr-web-app
  name: hr-web-app-service
spec:
  ports:
    - port: 8080
      protocol: TCP
      targetPort: 8080
      nodePort: 30082
  selector:
    app: hr-web-app
  type: NodePort
status:
  loadBalancer: {}
```

Question. 11

Use JSON PATH query to retrieve the osImages of all the nodes and store it in a file /opt/outputs/nodes_os_x43kj56.txt.

The osImages are under the nodeInfo section under status of each node.

Solution

```bash
kubectl get nodes -o jsonpath='{.items[*].status.nodeInfo.osImage}' > /opt/outputs/nodes_os_x43kj56.txt
```

Question. 12

Create a Persistent Volume with the given specification.

Solution

```yaml
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-analytics
spec:
  capacity:
    storage: 100Mi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteMany
  hostPath:
    path: /pv/data-analytics
```

## Mock Exam 2

1. Deploy a pod named nginx-pod using the nginx:alpine image.

```
k run nginx-pod --image=nginx:alpine
```

2
Deploy a messaging pod using the redis:alpine image with the labels set to tier=msg.

```
k run messaging --image=redis:alpine --labels=tier=msg
```

3
Create a namespace named apx-x9984574.

```
k create namespace apx-x9984574
```

4
Get the list of nodes in JSON format and store it in a file at /opt/outputs/nodes-z3444kd9.json.

```
k get nodes -o=json > /opt/outputs/nodes-z3444kd9.json
```

5
Create a service messaging-service to expose the messaging application within the cluster on port 6379.

Use imperative commands.

```
k expose pod messaging --name=messaging-service --type=ClusterIP --port=6379
```

6
Create a deployment named hr-web-app using the image kodekloud/webapp-color with 2 replicas.

```
k create deployment hr-web-app --image=kodekloud/webapp-color --replicas=2
```

7
Create a static pod named static-busybox on the controlplane node that uses the busybox image and the command sleep 1000.

```
kubectl run --restart=Never --image=busybox static-busybox --dry-run=client -oyaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml
```

8
Create a POD in the finance namespace named temp-bus with the image redis:alpine.

kubectl run temp-bus --image=redis:alpine --namespace=finance --restart=Never

9
A new application orange is deployed. There is something wrong with it. Identify and fix the issue.

```
kubectl describe po orange
kubectl edit po orange
kubectl replace -f /tmp/kubectl-edit-xxxx.yaml --force
```

10
Expose the hr-web-app as service hr-web-app-service application on port 30082 on the nodes on the cluster.
The web application listens on port 8080.

```
      k expose deployment hr-web-app --name=hr-web-app-service --port=30082 --target-port=8080
kubectl expose deployment hr-web-app --type=NodePort --port=8080 --name=hr-web-app-service --dry-run=client -o yaml > hr-web-app-service.yaml
```

11
Use JSON PATH query to retrieve the osImages of all the nodes and store it in a file /opt/outputs/nodes_os_x43kj56.txt.
The osImages are under the nodeInfo section under status of each node.

kubectl get nodes controlplane -o=jsonpath='{.status.nodeInfo.osImage}' > /opt/outputs/nodes_os_x43kj56.txt

12
Create a Persistent Volume with the given specification.

Volume Name: pv-analytics
Storage: 100Mi
Access modes: ReadWriteMany
Host Path: /pv/data-analytics

```
root@controlplane:~# cat pv-volume.yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-analytics
spec:
  capacity:
    storage: 100Mi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/pv/data-analytics"

k apply -f pv-volume.yaml
```

## Mock Exam 3

Question. 1
Create a new service account with the name pvviewer. Grant this Service account access to list all PersistentVolumes in the cluster by creating an appropriate cluster role called pvviewer-role and ClusterRoleBinding called pvviewer-role-binding.
Next, create a pod called pvviewer with the image: redis and serviceAccount: pvviewer in the default namespace.

Solution
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

Question. 2
List the InternalIP of all nodes of the cluster. Save the result to a file /root/CKA/node_ips.
Answer should be in the format: InternalIP of controlplane<space>InternalIP of node01 (in a single line)

Solution

```
kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}' > /root/CKA/node_ips
```

3.  Create a pod called multi-pod with two containers.
    Container 1, name: alpha, image: nginx
    Container 2: name: beta, image: busybox, command: sleep 4800

Environment Variables:
container 1:
name: alpha

Container 2:
name: beta

Solution

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

Question. 4
Create a Pod called non-root-pod , image: redis:alpine
runAsUser: 1000
fsGroup: 2000

Solution

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

Question. 5
We have deployed a new pod called np-test-1 and a service called np-test-service. Incoming connections to this service are not working. Troubleshoot and fix it.
Create NetworkPolicy, by the name ingress-to-nptest that allows incoming connections to the service over port 80.

Important: Don't delete any current objects deployed.

Solution

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

Question. 6
Taint the worker node node01 to be Unschedulable. Once done, create a pod called dev-redis, image redis:alpine, to ensure workloads are not scheduled to this worker node. Finally, create a new pod called prod-redis and image: redis:alpine with toleration to be scheduled on node01.

key: env_type, value: production, operator: Equal and effect: NoSchedule

Solution

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

Question. 7
Create a pod called hr-pod in hr namespace belonging to the production environment and frontend tier .
image: redis:alpine

Use appropriate labels and create all the required objects if it does not exist in the system already.

Solution

```bash
kubectl create namespace hr
kubectl run hr-pod --image=redis:alpine --namespace=hr --labels=environment=production,tier=frontend
```

Question. 8
A kubeconfig file called super.kubeconfig has been created under /root/CKA. There is something wrong with the configuration. Troubleshoot and fix it.

```bash
kubectl cluster-info --kubeconfig=/root/CKA/super.kubeconfig
```

Question. 9
We have created a new deployment called nginx-deploy. scale the deployment to 3 replicas. Has the replica's increased? Troubleshoot the issue and fix it.

```bash
kubectl scale deploy nginx-deploy --replicas=3
kubectl get pods -n kube-system

sed -i 's/kube-contro1ler-manager/kube-controller-manager/g' /etc/kubernetes/manifests/kube-controller-manager.yaml
```
