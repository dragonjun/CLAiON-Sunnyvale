# Setup Kubernetes Hands-on Environment on Amazon Linux 2

## Zsh 설치

```bash
$ sudo yum update -y && sudo yum install zsh -y
$ zsh --version
```

## shell 변경

```bash
$ sudo yum install util-linux-user -y
$ sudo chsh -s $(which zsh) $(whoami)
$ touch .zshrc
$ chmod 644 .zshrc
$ exit
```

## Oh My Zsh 설치

```bash
$ sudo yum install git -y
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

## AWS CLI 설치

```bash
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ aws --version
$ echo -e "\n# AWS CLI Command completion" >>~/.zshrc
$ echo "autoload bashcompinit && bashcompinit" >>~/.zshrc
$ echo "autoload -Uz compinit && compinit" >>~/.zshrc
$ echo "complete -C '/usr/local/bin/aws_completer' aws" >>~/.zshrc
$ source ~/.zshrc
```

## aws 설정

```bash
$ aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]: ap-northeast-2
Default output format [None]: json

$ aws configure list
```

## kubectl 설치

```bash
$ curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
$ chmod +x ./kubectl
$ mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
$ kubectl version --short --client
$ echo -e '\nexport PATH=$PATH:$HOME/bin' >> ~/.zshrc
$ echo -e '\n# Kubernetes auto completion' >>~/.zshrc
$ echo 'source <(kubectl completion zsh)' >>~/.zshrc
$ echo 'alias k=kubectl' >>~/.zshrc
$ echo 'complete -F __start_kubectl k' >>~/.zshrc
$ source ~/.zshrc
```

## kubeconfig 설정

```bash
$ aws sts get-caller-identity
$ aws eks update-kubeconfig --region ap-northeast-2 --name sunnyvale --verbose --alias sunnyvale
$ kubectl get svc
```

---

## References

- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [romkatv/powerlevel10k: A Zsh theme](https://github.com/romkatv/powerlevel10k)
- [AWS CLI Installing](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [AWS CLI Command completion](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html)
- [AWS CLI Configuration basics](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [aws configure](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/configure/index.html)
- [aws eks update-kubeconfig](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/eks/update-kubeconfig.html)
- [Using AWS CLI pagination options](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-pagination.html)
- [Installing kubectl](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
- [kubectl zsh auto-completion](https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-zsh/)
- [Helm | Installing Helm](https://helm.sh/docs/intro/install/)
