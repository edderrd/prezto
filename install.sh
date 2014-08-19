# execute scripts from bash your server
# wget -O - https://raw.githubusercontent.com/edderrd/prezto/master/install.sh | zsh

# Uninstall oh my zsh

# uninstall oh-my-zsh
if ! type "uninstall_oh_my_zsh" &> /dev/null; then
    echo "Uninstalling oh-my-zsh"
    uninstall_oh_my_zsh
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "removing remaining oh-my-zsh files"
    mv ~/.zshrc{,_bk}
    mv ~/.zprofile{,_bk}
    rm -vfr ~/.oh-my-zsh > /dev/null
fi

# start your zsh
zsh

# Open new shell, open zsh and clone the presto repo
git clone --recursive https://github.com/edderrd/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Get prezto's default configuration
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Change default shell to zsh
chsh -s /bin/zsh