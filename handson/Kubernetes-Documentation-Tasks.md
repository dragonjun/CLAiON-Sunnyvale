# Kubernetes Documentation Tasks

https://kubernetes.io/docs/tasks/

1. Install Tools
2. Administer a Cluster
3. Configure Pods and Containers
4. Manage Kubernetes Objects
5. Managing Secrets
6. Inject Data Into Applications
7. Run Applications
8. Run Jobs
9. Access Applications in a Cluster
10. Monitoring, Logging, and Debugging
11. Extend Kubernetes
12. TLS
13. Manage Cluster Daemons
14. Service Catalog
15. Networking
16. Configure a kubelet image credential provider
17. Extend kubectl with plugins
18. Manage HugePages
19. Schedule GPUs

```
1: Install Tools
  1.1: Install and Set Up kubectl on Linux
  1.2: Install and Set Up kubectl on macOS
  1.3: Install and Set Up kubectl on Windows
  1.4: Tools Included
  1.4.1: bash auto-completion on Linux
  1.4.2: bash auto-completion on macOS
  1.4.3: kubectl-convert overview
  1.4.4: PowerShell auto-completion
  1.4.5: verify kubectl install
  1.4.6: What's next?
  1.4.7: zsh auto-completion
2: Administer a Cluster
  2.1: Administration with kubeadm
  2.1.1: Certificate Management with kubeadm
  2.1.2: Configuring a cgroup driver
  2.1.3: Upgrading kubeadm clusters
  2.1.4: Adding Windows nodes
  2.1.5: Upgrading Windows nodes
  2.2: Migrating from dockershim
  2.2.1: Find Out What Container Runtime is Used on a Node
  2.2.2: Check whether Dockershim deprecation affects you
  2.2.3: Migrating telemetry and security agents from dockershim
  2.3: Certificates
  2.4: Manage Memory, CPU, and API Resources
  2.4.1: Configure Default Memory Requests and Limits for a Namespace
  2.4.2: Configure Default CPU Requests and Limits for a Namespace
  2.4.3: Configure Minimum and Maximum Memory Constraints for a Namespace
  2.4.4: Configure Minimum and Maximum CPU Constraints for a Namespace
  2.4.5: Configure Memory and CPU Quotas for a Namespace
  2.4.6: Configure a Pod Quota for a Namespace
  2.5: Install a Network Policy Provider
  2.5.1: Use Antrea for NetworkPolicy
  2.5.2: Use Calico for NetworkPolicy
  2.5.3: Use Cilium for NetworkPolicy
  2.5.4: Use Kube-router for NetworkPolicy
  2.5.5: Romana for NetworkPolicy
  2.5.6: Weave Net for NetworkPolicy
  2.6: Access Clusters Using the Kubernetes API
  2.7: Access Services Running on Clusters
  2.8: Advertise Extended Resources for a Node
  2.9: Autoscale the DNS Service in a Cluster
  2.10: Change the default StorageClass
  2.11: Change the Reclaim Policy of a PersistentVolume
  2.12: Cloud Controller Manager Administration
  2.13: Configure Quotas for API Objects
  2.14: Control CPU Management Policies on the Node
  2.15: Control Topology Management Policies on a node
  2.16: Customizing DNS Service
  2.17: Debugging DNS Resolution
  2.18: Declare Network Policy
  2.19: Developing Cloud Controller Manager
  2.20: Enable Or Disable A Kubernetes API
  2.21: Enabling Service Topology
  2.22: Encrypting Secret Data at Rest
  2.23: Guaranteed Scheduling For Critical Add-On Pods
  2.24: IP Masquerade Agent User Guide
  2.25: Limit Storage Consumption
  2.26: Migrate Replicated Control Plane To Use Cloud Controller Manager
  2.27: Namespaces Walkthrough
  2.28: Operating etcd clusters for Kubernetes
  2.29: Reconfigure a Node's Kubelet in a Live Cluster
  2.30: Reserve Compute Resources for System Daemons
  2.31: Running Kubernetes Node Components as a Non-root User
  2.32: Safely Drain a Node
  2.33: Securing a Cluster
  2.34: Set Kubelet parameters via a config file
  2.35: Share a Cluster with Namespaces
  2.36: Upgrade A Cluster
  2.37: Use Cascading Deletion in a Cluster
  2.38: Using a KMS provider for data encryption
  2.39: Using CoreDNS for Service Discovery
  2.40: Using NodeLocal DNSCache in Kubernetes clusters
  2.41: Using sysctls in a Kubernetes Cluster
  2.42: Utilizing the NUMA-aware Memory Manager
3: Configure Pods and Containers
  3.1: Assign Memory Resources to Containers and Pods
  3.2: Assign CPU Resources to Containers and Pods
  3.3: Configure GMSA for Windows Pods and containers
  3.4: Configure RunAsUserName for Windows pods and containers
  3.5: Create a Windows HostProcess Pod
  3.6: Configure Quality of Service for Pods
  3.7: Assign Extended Resources to a Container
  3.8: Configure a Pod to Use a Volume for Storage
  3.9: Configure a Pod to Use a PersistentVolume for Storage
  3.10: Configure a Pod to Use a Projected Volume for Storage
  3.11: Configure a Security Context for a Pod or Container
  3.12: Configure Service Accounts for Pods
  3.13: Pull an Image from a Private Registry
  3.14: Configure Liveness, Readiness and Startup Probes
  3.15: Assign Pods to Nodes
  3.16: Assign Pods to Nodes using Node Affinity
  3.17: Configure Pod Initialization
  3.18: Attach Handlers to Container Lifecycle Events
  3.19: Configure a Pod to Use a ConfigMap
  3.20: Share Process Namespace between Containers in a Pod
  3.21: Create static Pods
  3.22: Translate a Docker Compose File to Kubernetes Resources
  3.23: Enforce Pod Security Standards by Configuring the Built-in Admission Controller
  3.24: Enforce Pod Security Standards with Namespace Labels
  3.25: Migrate from PodSecurityPolicy to the Built-In PodSecurity Admission Controller
4: Manage Kubernetes Objects
  4.1: Declarative Management of Kubernetes Objects Using Configuration Files
  4.2: Declarative Management of Kubernetes Objects Using Kustomize
  4.3: Managing Kubernetes Objects Using Imperative Commands
  4.4: Imperative Management of Kubernetes Objects Using Configuration Files
  4.5: Update API Objects in Place Using kubectl patch
5: Managing Secrets
  5.1: Managing Secrets using kubectl
  5.2: Managing Secrets using Configuration File
  5.3: Managing Secrets using Kustomize
6: Inject Data Into Applications
  6.1: Define a Command and Arguments for a Container
  6.2: Define Dependent Environment Variables
  6.3: Define Environment Variables for a Container
  6.4: Expose Pod Information to Containers Through Environment Variables
  6.5: Expose Pod Information to Containers Through Files
  6.6: Distribute Credentials Securely Using Secrets
7: Run Applications
  7.1: Run a Stateless Application Using a Deployment
  7.2: Run a Single-Instance Stateful Application
  7.3: Run a Replicated Stateful Application
  7.4: Scale a StatefulSet
  7.5: Delete a StatefulSet
  7.6: Force Delete StatefulSet Pods
  7.7: Horizontal Pod Autoscaling
  7.8: HorizontalPodAutoscaler Walkthrough
  7.9: Specifying a Disruption Budget for your Application
  7.10: Accessing the Kubernetes API from a Pod
8: Run Jobs
  8.1: Running Automated Tasks with a CronJob
  8.2: Coarse Parallel Processing Using a Work Queue
  8.3: Fine Parallel Processing Using a Work Queue
  8.4: Indexed Job for Parallel Processing with Static Work Assignment
  8.5: Parallel Processing using Expansions
9: Access Applications in a Cluster
  9.1: Deploy and Access the Kubernetes Dashboard
  9.2: Accessing Clusters
  9.3: Configure Access to Multiple Clusters
  9.4: Use Port Forwarding to Access Applications in a Cluster
  9.5: Use a Service to Access an Application in a Cluster
  9.6: Connect a Frontend to a Backend Using Services
  9.7: Create an External Load Balancer
  9.8: List All Container Images Running in a Cluster
  9.9: Set up Ingress on Minikube with the NGINX Ingress Controller
  9.10: Communicate Between Containers in the Same Pod Using a Shared Volume
  9.11: Configure DNS for a Cluster
10: Monitoring, Logging, and Debugging
  10.1: Application Introspection and Debugging
  10.2: Auditing
  10.3: Debug a StatefulSet
  10.4: Debug Init Containers
  10.5: Debug Pods and ReplicationControllers
  10.6: Debug Running Pods
  10.7: Debug Services
  10.8: Debugging Kubernetes nodes with crictl
  10.9: Determine the Reason for Pod Failure
  10.10: Developing and debugging services locally
  10.11: Get a Shell to a Running Container
  10.12: Monitor Node Health
  10.13: Resource metrics pipeline
  10.14: Tools for Monitoring Resources
  10.15: Troubleshoot Applications
  10.16: Troubleshoot Clusters
  10.17: Troubleshooting
11: Extend Kubernetes
  11.1: Configure the Aggregation Layer
  11.2: Use Custom Resources
  11.2.1: Extend the Kubernetes API with CustomResourceDefinitions
  11.2.2: Versions in CustomResourceDefinitions
  11.3: Set up an Extension API Server
  11.4: Configure Multiple Schedulers
  11.5: Use an HTTP Proxy to Access the Kubernetes API
  11.6: Set up Konnectivity service
12: TLS
  12.1: Configure Certificate Rotation for the Kubelet
  12.2: Manage TLS Certificates in a Cluster
  12.3: Manual Rotation of CA Certificates
13: Manage Cluster Daemons
  13.1: Perform a Rolling Update on a DaemonSet
  13.2: Perform a Rollback on a DaemonSet
14: Service Catalog
  14.1: Install Service Catalog using Helm
  14.2: Install Service Catalog using SC
15: Networking
  15.1: Adding entries to Pod /etc/hosts with HostAliases
  15.2: Validate IPv4/IPv6 dual-stack
16: Configure a kubelet image credential provider
17: Extend kubectl with plugins
18: Manage HugePages
19: Schedule GPUs
```
