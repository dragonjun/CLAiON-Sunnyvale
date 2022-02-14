# Mock Exam 2

Question. 1

Take a backup of the etcd cluster and save it to `/opt/etcd-backup.db`.

Solution

```bash
export ETCDCTL_API=3
etcdctl snapshot save --endpoints https://[127.0.0.1]:2379 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key /opt/etcd-backup.db
```

Question. 2

Create a Pod called `redis-storage` with image `redis:alpine` with a Volume of type `emptyDir`
that lasts for the life of the Pod.

Solution

```bash
kubectl run redis-storage --image=redis:alpine --dry-run=client -oyaml > redis-storage.yaml
```

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: redis-storage
  name: redis-storage
spec:
  containers:
    - image: redis:alpine
      name: redis-storage
      volumeMounts:
        - mountPath: /data/redis
          name: temp-volume
  volumes:
    - name: temp-volume
      emptyDir: {}
```

Question. 3
Create a new pod called `super-user-pod` with image `busybox:1.28`.
Allow the pod to be able to set `system_time`.

Solution

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: super-user-pod
  name: super-user-pod
spec:
  containers:
    - command:
        - sleep
        - "4800"
      image: busybox:1.28
      name: super-user-pod
      securityContext:
        capabilities:
          add: ["SYS_TIME"]
  dnsPolicy: ClusterFirst
  restartPolicy: Always
```

Question. 4

A pod definition file is created at `/root/CKA/use-pv.yaml`.
Make use of this manifest file and mount the persistent volume called `pv-1`.
Ensure the pod is running and the PV is bound.

mountPath: `/data`

persistentVolumeClaim Name: `my-pvc`

Solution

```yaml
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Mi
```

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: use-pv
  name: use-pv
spec:
  containers:
    - image: nginx
      name: use-pv
      volumeMounts:
        - mountPath: "/data"
          name: mypd
  volumes:
    - name: mypd
      persistentVolumeClaim:
        claimName: my-pvc
```

```bash
kubectl create -f /root/CKA/use-pv.yaml
```

Question. 5

Solution

Create a new deployment called `nginx-deploy`, with image `nginx:1.16` and `1` replica.
Next upgrade the deployment to version `1.17` using rolling update.

```bash
$ kubectl create deployment nginx-deploy --image=nginx:1.16 --dry-run=client -o yaml > deploy.yaml
$ kubectl apply -f deploy.yaml --record
$ kubectl rollout history deployment nginx-deploy
$ kubectl set image deployment/nginx-deploy nginx=nginx:1.17 --record
$ kubectl rollout history deployment nginx-deploy
```

Question. 6

Create a new user called `john`.
Grant him access to the cluster.
John should have permission to `create, list, get, update and delete pods` in the `development` namespace.
The private key exists in the location: `/root/CKA/john.key` and csr at `/root/CKA/john.csr`.

`Important Note`: As of kubernetes 1.19, the CertificateSigningRequest object expects a `signerName`.

Solution

```yaml
---
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: john-developer
spec:
  signerName: kubernetes.io/kube-apiserver-client
  request: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURSBSRVFVRVNULS0tLS0KTUlJQ1ZEQ0NBVHdDQVFBd0R6RU5NQXNHQTFVRUF3d0VhbTlvYmpDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRApnZ0VQQURDQ0FRb0NnZ0VCQUt2Um1tQ0h2ZjBrTHNldlF3aWVKSzcrVVdRck04ZGtkdzkyYUJTdG1uUVNhMGFPCjV3c3cwbVZyNkNjcEJFRmVreHk5NUVydkgyTHhqQTNiSHVsTVVub2ZkUU9rbjYra1NNY2o3TzdWYlBld2k2OEIKa3JoM2prRFNuZGFvV1NPWXBKOFg1WUZ5c2ZvNUpxby82YU92czFGcEc3bm5SMG1JYWpySTlNVVFEdTVncGw4bgpjakY0TG4vQ3NEb3o3QXNadEgwcVpwc0dXYVpURTBKOWNrQmswZWhiV2tMeDJUK3pEYzlmaDVIMjZsSE4zbHM4CktiSlRuSnY3WDFsNndCeTN5WUFUSXRNclpUR28wZ2c1QS9uREZ4SXdHcXNlMTdLZDRaa1k3RDJIZ3R4UytkMEMKMTNBeHNVdzQyWVZ6ZzhkYXJzVGRMZzcxQ2NaanRxdS9YSmlyQmxVQ0F3RUFBYUFBTUEwR0NTcUdTSWIzRFFFQgpDd1VBQTRJQkFRQ1VKTnNMelBKczB2czlGTTVpUzJ0akMyaVYvdXptcmwxTGNUTStsbXpSODNsS09uL0NoMTZlClNLNHplRlFtbGF0c0hCOGZBU2ZhQnRaOUJ2UnVlMUZnbHk1b2VuTk5LaW9FMnc3TUx1a0oyODBWRWFxUjN2SSsKNzRiNnduNkhYclJsYVhaM25VMTFQVTlsT3RBSGxQeDNYVWpCVk5QaGhlUlBmR3p3TTRselZuQW5mNm96bEtxSgpvT3RORStlZ2FYWDdvc3BvZmdWZWVqc25Yd0RjZ05pSFFTbDgzSkljUCtjOVBHMDJtNyt0NmpJU3VoRllTVjZtCmlqblNucHBKZWhFUGxPMkFNcmJzU0VpaFB1N294Wm9iZDFtdWF4bWtVa0NoSzZLeGV0RjVEdWhRMi80NEMvSDIKOWk1bnpMMlRST3RndGRJZjAveUF5N05COHlOY3FPR0QKLS0tLS1FTkQgQ0VSVElGSUNBVEUgUkVRVUVTVC0tLS0tCg==
  usages:
    - digital signature
    - key encipherment
    - client auth
  groups:
    - system:authenticated
```

```bash
$ kubectl certificate approve john-developer
$ kubectl create role developer --resource=pods --verb=create,list,get,update,delete --namespace=development
$ kubectl create rolebinding developer-role-binding --role=developer --user=john --namespace=development
$ kubectl auth can-i update pods --as=john --namespace=development
```

Question. 7

Create a nginx pod called `nginx-resolver` using image `nginx`,
expose it internally with a service called `nginx-resolver-service`.
Test that you are able to look up the service and pod names from within the cluster.
Use the image `busybox:1.28` for dns lookup. Record results in `/root/CKA/nginx.svc` and `/root/CKA/nginx.pod`

Solution

```bash
kubectl run nginx-resolver --image=nginx
kubectl expose pod nginx-resolver --name=nginx-resolver-service --port=80 --target-port=80 --type=ClusterIP

kubectl run test-nslookup --image=busybox:1.28 --rm -it --restart=Never -- nslookup nginx-resolver-service
kubectl run test-nslookup --image=busybox:1.28 --rm -it --restart=Never -- nslookup nginx-resolver-service > /root/CKA/nginx.svc

kubectl get pod nginx-resolver -o wide
kubectl run test-nslookup --image=busybox:1.28 --rm -it --restart=Never -- nslookup <P-O-D-I-P.default.pod> > /root/CKA/nginx.pod
```

Question. 8

Create a static pod on `node01` called `nginx-critical` with image `nginx`
and make sure that it is recreated/restarted automatically in case of a failure.

Use `/etc/kubernetes/manifests` as the Static Pod path for example.

Solution

```bash
kubectl run nginx-critical --image=nginx --dry-run=client -o yaml > static.yaml
```

```bash
root@controlplane:~# scp static.yaml node01:/root/
```

```bash
root@controlplane:~# kubectl get nodes -o wide

# Perform SSH
root@controlplane:~# ssh node01
OR
root@controlplane:~# ssh <IP of node01>
```

```bash
root@node01:~# mkdir -p /etc/kubernetes/manifests
root@node01:~# vi /var/lib/kubelet/config.yaml
```

staticPodPath: /etc/kubernetes/manifests/ 추가

```bash
root@node01:~# cp /root/static.yaml /etc/kubernetes/manifests/
```

```bash
root@node01:~# exit
logout
root@controlplane:~# kubectl get pods
```
