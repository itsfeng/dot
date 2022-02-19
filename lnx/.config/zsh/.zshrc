#   Basic stuff
#   ------------------------------------------------------------
# source ~/.config/zsh/.zprofile #.zshenv stuff
source ~/.config/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export MANPAGER='nvim +Man!'
export TERM="xterm-256color"
autoload -Uz compinit && compinit -i
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -U bashcompinit && bashcompinit

#   Locale
#   ------------------------------------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

#   Set Paths
#   ------------------------------------------------------------
export PATH="/usr/local/git/bin:/usr/local/bin:/usr/local/:/usr/local/sbin$PATH:"
export PATH="$HOME/bin:$PATH"

#   Plugins
#   ------------------------------------------------------------
plugins=(history-substring-search git safe-paste colorize zsh-autosuggestions)

# Prompt Settings
declare -a PROMPTS
PROMPTS=(
    "∮"
    "∯"
    "≎"
    ""
    ""
    ""
    ""
    ""
    ""
)
RANDOM=$$$(date +%s)
ignition=${PROMPTS[$RANDOM % ${#RANDOM[*]}+1]}
if [[ $EUID -ne 0 ]]; then
   PROMPT="%F{green}%m%f %F{yellow}%1~%f %F{green}$ignition%f "
else
   PROMPT="%F{red}%m%f %F{yellow}%1~%f %F{green}$ignition%f "
fi

## Git Settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#   Theming
#   ------------------------------------------------------------
ZSH_THEME="avit"
autoload -U colors && colors

#  fzf config
#  ------------------------------------------------------------
export FZF_COMPLETION_TRIGGER=';;'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#   History Configuration
#   ------------------------------------------------------------
HISTSIZE=5000
HISTFILE=~/.config/zsh/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory

#   Better less config
#   ------------------------------------------------------------
export LESS='--ignore-case --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=4 -rR'
export LESSOPEN="| src-hilite-lesspipe.sh %s"
# or the short version
# export LESS='-F -i -J -M -R -W -x4 -X -z-4 -r'
# Set colors for less. https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

#   MAKE TERMINAL BETTER
#   ------------------------------------------------------------
#alias ll='exa --group-directories-first --git -lbF'
#alias lo='exa --group-directories-first --git -labF'
alias ll='ls -lh'
alias lo='ls -alh'
alias cp='cp -iv'
alias ..='cd ../'
alias ..='cd ../'
alias digq='dig -q'
alias digx='dig -x'
alias ~="cd ~"
alias c='clear'
alias tx='tar -xvz'
alias txz='tar -xf'
alias sys='sudo systemctl'
alias jou='sudo journalctl'
alias susp+="killall systemd-inhibit"
alias auu='sudo apt update && sudo apt upgrade'
alias shn='shutdown now'
alias rb='reboot now'
alias dc='docker-compose'
alias vim='nvim'

#   Personal Aliases
#   ------------------------------------------------------------
alias v='nvim'
alias vim='nvim'
alias m='vifm'
alias digq='dig -q'
alias digx='dig -x'
alias cht='() { cheat -c $1 | less -r ;}'

#   Git
#
alias ga='git add'
alias gaa='git add --all'
alias gst='git status'
alias gp='git push'
alias gl='git pull'
alias gcam="git commit -a -m"
alias glog='git log --oneline --decorate --graph'

#   ZSH
#   ------------------------------------------------------------ 
alias zshconfig='vim ~/.zshrc'
alias zshsource='exec $SHELL'
alias zshhistoryreload='fc -R'
alias zshaliases='cat ~/.zshrc | grep alias'

#   Functions
#   -----------------------------------------------------------
ssha() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed
}
