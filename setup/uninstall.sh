rm -rf ~/.oh-my-zsh
rm -f ~/.zshrc
rm -f ~/.zsh_history
rm -f ~/.zcompdump*
rm -f ~/.p10k.zsh
rm -rf ~/bin/kubectl
rm -rf ~/temp
rm -rf ~/.aws
rm -rf ~/.kube
sudo rm -rf /usr/local/aws-cli/
sudo rm -f /usr/local/bin/aws
sudo rm -f /usr/local/bin/helm
sudo chsh -s $(which bash) $(whoami)
