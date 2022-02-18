# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#   History Configuration
#   ------------------------------------------------------------
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
#HISTDUP=erase
setopt    appendhistory
setopt    sharehistory
setopt    incappendhistory

#   fzf config
#   ------------------------------------------------------------
export FZF_COMPLETION_TRIGGER=';;'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#   ZSH                                                                             
#   ------------------------------------------------------------                    
alias zshconfig='vim ~/.zshrc'                                                      
alias zshsource='exec $SHELL'                                                       
alias zshhistoryreload='fc -R'                                                      
alias zshaliases='cat ~/.zshrc | grep alias'

#   Set Paths
#    ------------------------------------------------------------
export PATH="/usr/local/git/bin:/usr/local/bin:/usr/local/:/usr/local/sbin:/data/data/com.termux/files/home/Bin/bin:$PATH"

#   MAKE TERMINAL BETTER
#   ------------------------------------------------------------
alias sudo=' sudo'
alias cp='cp -iv' 
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias lo='ls -FlAhp --color --group-directories-first'
alias ll='ls -Flhp --color --group-directories-first'
alias less='less -FSRXc'
cd() { builtin cd "$@"; ll; }
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias ~="cd ~"
alias c='clear'
alias which='type -all'
alias path='echo -e ${PATH//:/\\n}'
mcd () { mkdir -p "$1" && cd "$1"; }
ql () { qlmanage -p "$*" >& /dev/null; }
alias tx='tar -xvzf'
alias txz='tar xf'
alias nsl='nslookup'
alias sys='sudo systemctl'
alias jou='sudo journalctl'
alias auu='sudo apt update && sudo apt upgrade'
alias digq='dig -q'
alias digx='dig -x'
alias srd='sr duckduckgo'

jpull() {
       cd ~/Gits/notes/
       git pull
}

jcom() {
	cd ~/Gits/notes/
	ga journal.txt
	gcam 'add journal entry'
	gp
}

ssha() {
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed
}

