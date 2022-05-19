# Copyright 2008 Bernd Steinhauser <berniyh@exherbo.org>
# Distributed under the terms of the GNU General Public License v2

# Add a local FPATH
if [[ -d /etc/zsh/site-functions ]]; then
	FPATH=/etc/zsh/site-functions:${FPATH}
fi
export PATH="/home/sigma/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:"
export PATH="${PATH}/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:"
export PATH="${PATH}/home/sigma/.emacs.d/bin:/home/sigma/.cargo/bin"
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
setopt CORRECT
setopt EXTENDED_HISTORY
#setopt MENUCOMPLETE
setopt ALL_EXPORT

setopt appendhistory autocd beep extendedglob nomatch
setopt correctall

zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile

case $(uname -s) in
Linux)
    alias ls="ls --color=auto";;
FreeBSD)
    alias ls="ls -G";;
esac
alias cat="bat -p"
alias shred="shred -zf"
alias python="python3"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"

selfupdate() {
    ZSHRC_URL="http://github.com/sigmw/dotfiles/raw/master/zshrc"
    echo "Updating zshrc from $ZSHRC_URL..."
    echo "Press Ctrl+C within 5 seconds to abort..."
    sleep 5
    case $(uname -s) in
    Linux)
        ZSHRC_FILE=/etc/zsh/zshrc;;
    FreeBSD)
        ZSHRC_FILE=/etc/zshrc;;
    *)
        ZSHRC_FILE=/etc/zsh/zshrc;;
    esac
    cp $ZSHRC_FILE /tmp/zshrc.bak
    sudo wget $ZSHRC_URL -O $ZSHRC_FILE
    echo "Done. Old zshrc saved to /tmp/zshrc"
}

autoload -Uz compinit
compinit

bindkey "\e[H" beginning-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[1~" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[3~" delete-char
bindkey "\e[d" backward-word
bindkey "\e[c" forward-word

setprompt

