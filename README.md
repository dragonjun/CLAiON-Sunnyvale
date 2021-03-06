# CLAiON Sunnyvale Project

## 개발 환경 설정

1. [WSL 설치](https://docs.microsoft.com/ko-kr/windows/wsl/install)
1. [Docker Desktop](https://docs.docker.com/get-docker/) 설치
1. [Visual Studio Code](https://code.visualstudio.com/Download)

### Zsh 설치

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install zsh -y
zsh --version
```

### shell 변경

```bash
sudo chsh -s $(which zsh) $(whoami)
touch .zshrc
chmod 644 .zshrc
exit
```

### Oh My Zsh 설치

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

.zshrc 파일에서 `plugins=(git)`을 `plugins=(git zsh-autosuggestions zsh-syntax-highlighting)`으로 수정하거나 다음 커맨드 실행

```bash
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
```

### AWS CLI 설치

```bash
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
echo "# AWS CLI Command completion" >>~/.zshrc
echo "autoload bashcompinit && bashcompinit" >>~/.zshrc
echo "autoload -Uz compinit && compinit" >>~/.zshrc
echo "complete -C '/usr/local/bin/aws_completer' aws" >>~/.zshrc
source ~/.zshrc
```

### aws 설정

```bash
$ aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: ap-northeast-2
Default output format [None]: json

$ aws configure list
```

### kubectl 설치

```bash
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
kubectl version --short --client
echo 'export PATH=$PATH:$HOME/bin' >> ~/.zshrc
echo '# Kubernetes auto completion' >>~/.zshrc
echo 'source <(kubectl completion zsh)' >>~/.zshrc
echo 'alias k=kubectl' >>~/.zshrc
echo 'complete -F __start_kubectl k' >>~/.zshrc
source ~/.zshrc
```

### kubeconfig 설정

```bash
aws --no-cli-pager sts get-caller-identity
aws eks update-kubeconfig --name sunnyvale --alias handson
kubectl config set contexts.handson.namespace <insert-your-name-here>
kubectl get svc
```

---

## 참고자료

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Installing or updating the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [AWS CLI Command completion](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html)
- [Configuration basics](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [Installing kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
- [kubectl zsh auto-completion](https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/)
- [Kubernetes : https://kubernetes.io](https://kubernetes.io)
- [Helm : https://helm.sh](https://helm.sh)
- [Docker Hub](https://hub.docker.com/)
- [Artifact Hub](https://artifacthub.io/)
- [Bitnami: Packaged Applications for Any Platform - Cloud, Container, Virtual Machine](https://bitnami.com/)
- [Connecting Applications with Services](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)
