#   Basic stuff
#   ------------------------------------------------------------
# source ~/.config/zsh/.zprofile #.zshenv stuff
source ~/.config/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export TERM="xterm-256color"
export HISTFILE=~/.config/zsh/.zsh_history

export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export MANPAGER='nvim +Man!'

#   Path to your oh-my-zsh installation.
#   ------------------------------------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#   Theming
#   ------------------------------------------------------------
ZSH_THEME="avit"
autoload -U colors && colors

#   Add wisely, as too many plugins slow down shell startup.
#   ------------------------------------------------------------
plugins=(history-substring-search ansible git colorize zsh-autosuggestions zsh-syntax-highlighting conda-zsh-completion)

#   Load oh-my-zsh
#   ------------------------------------------------------------
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
autoload -U bashcompinit && bashcompinit

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
PROMPT='%F{yellow}%1~%f %F{green}$ignition%f '

## Git Settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#   fzf
#   ------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER=';;'

#   History Configuration
#   ------------------------------------------------------------
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.config/zsh/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed

#   Go configuration
#   Preferred editor for local and remote sessions
#   ------------------------------------------------------------
export EDITOR='nvim'
export GOPATH="$HOME/.go"
export GOROOT="/usr/local/opt/go/libexec"
export GOBIN="$GOPATH/bin"

#   Python foo
#   ------------------------------------------------------------
alias py='python3'

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

#   Set Paths
#   ------------------------------------------------------------
export PATH="/usr/local/git/bin:/usr/local/bin:/usr/local/:/usr/local/sbin:$PATH"
export PATH="$HOME/bin/:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH/"
export PATH="/opt/homebrew/bin:$PATH"

#   MAKE TERMINAL BETTER
#   ------------------------------------------------------------
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias ..='cd ../'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='exa --group-directories-first --git -lbF'
alias lo='exa --group-directories-first --git -labF'
alias llt='exa --group-directories-first --git --tree -lbF '
alias lot='exa --group-directories-first --git -labF'
#alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias ~="cd ~"                              # ~: Go Home
alias c='clear'                             # c: Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path: Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside
ql () { qlmanage -p "$*" >& /dev/null; }    # ql: Opens any file in MacOS Quicklook Preview
alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~: Go Home
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty: Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic: Make tab-completion case-insensitive
alias ips='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias tx='tar -xvzf'
alias txz='tar -xf'

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
alias zshconfig='nvim ~/.config/zsh/.zshrc'
alias zshsource='exec $SHELL'
alias zshhistoryreload='fc -R'
alias zshaliases='cat ~/.config/zsh/.zshrc | grep alias'

#   Copy & Paste
#   ------------------------------------------------------------
pbc () { pbcopy < "$1";}
alias pbp='pbpaste'

if [ -f ~/.config/zshalias/zshalias ]; then
    source ~/.config/zshalias/zshalias
else
    print "404: ~/.config/zshalias/zshalias not found."
fi

#   aws & gcloud
#   ------------------------------------------------------------
export AWS_PAGER=""
export CLOUDSDK_PYTHON=/usr/local/bin/python3


#   The next line updates PATH for the Google Cloud SDK.
#   ------------------------------------------------------------
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
#   The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'; fi

#  terraform
#   ------------------------------------------------------------
complete -o nospace -C /usr/local/bin/terraform terraform
