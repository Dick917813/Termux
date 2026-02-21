sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*x11 main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-x11 x11 main @' $PREFIX/etc/apt/sources.list.d/x11.list
sed -i 's@^\(deb.*root main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-root root main @' $PREFIX/etc/apt/sources.list.d/root.list
pkg update
pkg upgrade
echo "" > $PREFIX/etc/motd
pkg install -y python3 clang cmake make vim neovim nano x11-repo proot-distro git curl wget openssh tree rust  openssl zip unzip zsh neofetch termux-x11-nightly xwayland
python -m pip install --upgrade pip
pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
echo -e "\nneofetch" >> ~/.zshrc
chsh -s zsh