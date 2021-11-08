# CLAION Sunnyvale Project

## 사전 준비

1. WSL 2 설치
1. Docker Desktop

## 설치

### 폰트

- [D2 Coding](https://github.com/naver/d2codingfont)

### Visual Studio Code

- [Download](https://code.visualstudio.com/Download)

**Extensions**

- Remote - WSL
- indent-rainbow
- Prettier - Code formatter

**설정**

- editor.acceptSuggestionOnEnter
- editor.fontFamily
- editor.bracketPairColorization.enabled
- editor.guides.bracketPairs
- yaml

### zsh 설치

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install zsh -y
zsh --version

sudo vi /etc/passwd # /bin/bash -> /bin/zsh
# shell 다시 실행하고 0 선택

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 플러그인
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

vi ~/.zshrc
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source ~/.zshrc
```

### AWS CLI

```bash
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: ap-northeast-2
Default output format [None]: yaml

aws configure list
aws sts get-caller-identity
```

### kubectl

```bash
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --short --client
echo 'source <(kubectl completion zsh)' >>~/.zshrc
echo 'alias k=kubectl' >>~/.zshrc
echo 'complete -F __start_kubectl k' >>~/.zshrc
source ~/.zshrc

aws eks --region ap-northeast-2 update-kubeconfig --name sunnyvale --verbose --alias sunnyvale
kubectl get svc
```

## Namespace

```bash
kubectl create namespace <insert-namespace-name-here>
echo 'alias kn="kubectl --namespace=class1109"' >>~/.zshrc
```

---

## 참고자료

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Installing or updating the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Configuration basics](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [Installing kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
- [zsh auto-completion](https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/)
- [Kubernetes : https://kubernetes.io](https://kubernetes.io)
- [Helm : https://helm.sh](https://helm.sh)
- [Docker Hub](https://hub.docker.com/)
- [Artifact Hub](https://artifacthub.io/)
- [Bitnami: Packaged Applications for Any Platform - Cloud, Container, Virtual Machine](https://bitnami.com/)
- [Connecting Applications with Services](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)
