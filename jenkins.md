# Jenkins on AWS

1. Amazon Linux 2 AMI 인스턴스를 생성

2. 인스턴스에 로그인

```bash
ssh -i <Private key file> ec2-user@<Public IPv4 DNS>
```

3. LTS 릴리즈 설치

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo amazon-linux-extras install epel -y
sudo yum install java-11-amazon-corretto-headless -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
```

4. jenkins 시작

```bash
sudo systemctl start jenkins
sudo systemctl status jenkins
```

## 참고자료

- [Installing Jenkins : Linux](https://www.jenkins.io/doc/book/installing/linux/)
- [Amazon Corretto 11 Installation Instructions for Amazon Linux 2](https://docs.aws.amazon.com/corretto/latest/corretto-11-ug/amazon-linux-install.html)
- [EPEL 리포지토리 활성화](https://aws.amazon.com/ko/premiumsupport/knowledge-center/ec2-enable-epel/)
