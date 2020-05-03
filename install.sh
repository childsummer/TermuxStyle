#!/data/data/com.termux/files/usr/bin/bash
termux-setup-storage

apt update
apt install -y git zsh
git clone https://github.com/yuhuan-afk/TermuxStyle.git "$HOME/termux-ohmyzsh" --depth 1
echo "等我一下，快好了！"

mv "$HOME/.termux" "$HOME/.termux.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp -R "$HOME/termux-ohmyzsh/.termux" "$HOME/.termux"

git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1
mv "$HOME/.zshrc" "$HOME/.zshrc.bak.$(date +%Y.%m.%d-%H:%M:%S)"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
sed -i '/^ZSH_THEME/d' "$HOME/.zshrc"
sed -i '1iZSH_THEME="agnoster"' "$HOME/.zshrc"
echo "alias chcolor='$HOME/.termux/colors.sh'" >> "$HOME/.zshrc"
echo "alias chfont='$HOME/.termux/fonts.sh'" >> "$HOME/.zshrc"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting" --depth 1
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"

chsh -s zsh

echo "裝好了，做的真棒！"
echo ""
echo "首先選配色〜"
$HOME/.termux/colors.sh

echo "接著選字體～"
$HOME/.termux/fonts.sh

echo "安裝好了，漂亮！重啟Termux吧！"
echo ""
echo "原作者：oh-my-zsh on GitHub，"
echo "中文化：yuhuan-afk on GitHub。"

exit
