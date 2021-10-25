# CLAION Sunnyvale Project

GitHub에서 Kubernetes 클러스터로 배포되는 CI/CD 파이프라인을 구축한다.

다음 스택을 사용

- Git/GitHub
- AWS CodePipeline
- AWS CodeBuild
- Kubernetes
- Helm

## 사전 준비

1. WSL 2 설치
1. AWS CLI 설치

## 설치

**kubectl 설치**

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --short --client
echo 'source <(kubectl completion zsh)' >>~/.zshrc
echo 'alias k=kubectl' >>~/.zshrc
echo 'complete -F __start_kubectl k' >>~/.zshrc
```

**eksctl 설치**

```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```

---

## 참고자료

- [Git : https://git-scm.com](https://git-scm.com)
- [GitHub : https://github.com](https://github.com)
- [AWS CodePipeline : https://aws.amazon.com/ko/codepipeline](https://aws.amazon.com/ko/codepipeline)
- [AWS CodeBuild : https://aws.amazon.com/ko/codebuild](https://aws.amazon.com/ko/codebuild)
- [Kubernetes : https://kubernetes.io](https://kubernetes.io)
- [Helm : https://helm.sh](https://helm.sh)
- [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [zsh auto-completion](https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/)
- [The official CLI for Amazon EKS](https://github.com/weaveworks/eksctl)
