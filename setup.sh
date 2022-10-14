sudo pacman-mirrors -i -c China -m rank 
sudo pacman -Syyu
sudo pacman -S neovim
sudo sed -i '$a[archlinuxcn]\n = Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' /etc/pacman.conf
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
sudo yay -S zsh
bash ./install_oh_my_zsh.sh
chsh -s /bin/zsh
sudo cp .vimrc ~
sudo cp .zshrc ~
git config --global user.email "liuzhenm@mail.ustc.edu.cn"
git config --global user.name "liuzhen"
sudo pacman -S net-tools
sudo pacman -S gdb
sudo pacman -S openssh
sudo systemctl enable ssh
sudo systemctl start sshd
sudo pacman -S tmux
cp ~/linuxconfig/.tmux.conf ~
git clone git@github.com:zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
