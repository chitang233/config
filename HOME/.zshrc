source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/vi.zsh
source ~/.config/zsh/navi.zsh

ZIM_HOME=~/.zim
source ${ZIM_HOME}/init.zsh
zmodload -F zsh/terminfo +p:terminfo
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key

source ~/.config/zsh/completion.zsh
source ~/.config/zsh/rustup_completions.zsh

setopt HIST_IGNORE_ALL_DUPS
setopt CORRECT
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
WORDCHARS=${WORDCHARS//[\/]}
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
. "/home/chitang/.local/cargo/env" 

export PATH=$PATH:/home/chitang/.local/bin:/home/chitang/.local/go/bin
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export NVM_DIR="$HOME/.nvm"
load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Source nvm
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # Source bash_completion
}
nvm() {
  unfunction $0
  load_nvm
  $0 "$@"
}
node() {
  unfunction $0
  load_nvm
  $0 "$@"
}
npm() {
  unfunction $0
  load_nvm
  $0 "$@"
}

