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
$ curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
$ chmod +x ./kubectl
$ mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
$ echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
$ kubectl version --short --client
```

---

## 참고자료

- [Git : https://git-scm.com](https://git-scm.com)
- [GitHub : https://github.com](https://github.com)
- [AWS CodePipeline : https://aws.amazon.com/ko/codepipeline](https://aws.amazon.com/ko/codepipeline)
- [AWS CodeBuild : https://aws.amazon.com/ko/codebuild](https://aws.amazon.com/ko/codebuild)
- [Kubernetes : https://kubernetes.io](https://kubernetes.io)
- [Helm : https://helm.sh](https://helm.sh)
- [Installing kubectl : https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
