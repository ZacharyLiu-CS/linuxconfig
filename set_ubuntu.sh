sudo sed -i 's/cn.archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
sudo apt update
sudo apt upgrade
sudo apt install vim
sudo apt install zsh
sudo apt install build-essential
sudo apt install git
sudo apt install htop
sudo apt install nodejs
sudo apt install curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh
sudo cp ~/linuxconfig/.vimrc ~
git config --global user.email "liuzhenm@mail.ustc.edu.cn"
git config --global user.name "liuzhen"
git config --global push.default matching
git clone https://github.com/glommy-left-hand/linuxconfig.git ~
sudo apt install openssh-server
sudo systemctl enable ssh
sudo systemctl start sshd
sudo apt install tmux
cp ~/linuxconfig/.tmux.conf ~
git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
