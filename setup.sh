sudo pacman-mirrors -i -c China -m rank 
sudo pacman -Syyu
sudo pacman -S neovim
sudo sed -i '$a[archlinuxcn]\nSigLevel = Optional TrustedOnly\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' /etc/pacman.conf
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
sudo pacman -S yay
sudo pacman -S nodejs
sudo yay -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh
git config --global user.email "liuzhenm@mail.ustc.edu.cn"
git config --global user.name "liuzhen"
sudo pacman -S net-tools
sudo pacman -S gdb
sudo pacman -S wireshark-qt
sudo pacman -S openssh
sudo systemctl enable ssh
sudo systemctl start sshd
sudo pacman -S tmux
cp ~/linuxconfig/.tmux.conf ~
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
