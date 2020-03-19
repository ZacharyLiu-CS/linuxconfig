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
