# Setup Kubernetes Hands-on Environment on Amazon Linux 2

## Step by Step

### Zsh 설치

```bash
$ sudo apt update && sudo apt upgrade -y
$ sudo apt install zsh -y
$ zsh --version
```

### shell 변경

```bash
$ sudo chsh -s $(which zsh) $(whoami)
$ touch .zshrc
$ chmod 644 .zshrc
$ exit
```

### Oh My Zsh 설치

```bash
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 플러그인
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

.zshrc 파일에서 plugins을 다음으로 수정한다.

```
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

### AWS CLI 설치

```bash
$ sudo apt install unzip
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ aws --version
$ echo "\n# AWS CLI Command completion" >>~/.zshrc
$ echo "autoload bashcompinit && bashcompinit" >>~/.zshrc
$ echo "autoload -Uz compinit && compinit" >>~/.zshrc
$ echo "complete -C '/usr/local/bin/aws_completer' aws" >>~/.zshrc
$ source ~/.zshrc
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
$ curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
$ chmod +x ./kubectl
$ mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
$ kubectl version --short --client
$ echo '\nexport PATH=$PATH:$HOME/bin' >> ~/.zshrc
$ echo '\n# Kubernetes auto completion' >>~/.zshrc
$ echo 'source <(kubectl completion zsh)' >>~/.zshrc
$ echo 'alias k=kubectl' >>~/.zshrc
$ echo 'complete -F __start_kubectl k' >>~/.zshrc
$ source ~/.zshrc
```

### kubeconfig 설정

```bash
$ aws sts get-caller-identity
$ aws eks update-kubeconfig --region ap-northeast-2 --name sunnyvale --verbose --alias sunnyvale
$ kubectl get svc
```

## Quick Setup

### Step 1

```bash
$ mkdir temp && cd temp && \
  sudo apt update && sudo apt upgrade -y && \
  sudo apt install zsh -y && \
  zsh --version && \
  sudo chsh -s $(which zsh) $(whoami) && \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
  sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc && \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc && \
  sudo apt install unzip && \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  sudo ./aws/install && \
  aws --version && \
  echo -e "\n# AWS CLI Command completion" >>~/.zshrc && \
  echo "autoload bashcompinit && bashcompinit" >>~/.zshrc && \
  echo "autoload -Uz compinit && compinit" >>~/.zshrc && \
  echo "complete -C '/usr/local/bin/aws_completer' aws" >>~/.zshrc && \
  curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin && \
  kubectl version --short --client && \
  echo -e '\nexport PATH=$PATH:$HOME/bin' >> ~/.zshrc && \
  echo -e '\n# Kubernetes auto completion' >>~/.zshrc && \
  echo 'source <(kubectl completion zsh)' >>~/.zshrc && \
  echo 'alias k=kubectl' >>~/.zshrc && \
  echo 'complete -F __start_kubectl k' >>~/.zshrc && \
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
  chmod 700 get_helm.sh && \
  ./get_helm.sh && \
  echo -e '\n# Helm auto completion' >>~/.zshrc && \
  echo 'source <(helm completion zsh)' >>~/.zshrc && \
  cd ~
```

```bash
exit
```

### Step 2

```bash
$ aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: ap-northeast-2
Default output format [None]: json

$ aws configure list

$ aws --no-cli-pager sts get-caller-identity && \
  aws eks update-kubeconfig --region ap-northeast-2 --name sunnyvale --verbose --alias sunnyvale && \
  kubectl get svc
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
- [Using AWS CLI pagination options](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-pagination.html)
- [aws configure](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/configure/index.html)
- [aws eks update-kubeconfig](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/eks/update-kubeconfig.html)
