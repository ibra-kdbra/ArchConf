# root bash config

# colors and styles
red_revert="\[\e[7;31m\]"
bright_black="\[\e[0;90m\]"
reset="\[\e[m\]"

# alias

# git
alias gs='git status'
alias gl='git log'
alias glg='git log --graph'
alias ga.='git add .'
alias gd='git diff'
alias gdt='git difftool --tool=vimdiff'
alias gcm='git commit'
alias gpl='git pull'
alias gpu='git push'
alias dpkgs='vimdiff /usr/share/archiso/configs/releng/packages.x86_64 packages.x86_64'

# dir
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias mkd='mkdir -pv'

# files
alias ls='ls -h --color'
alias lsa='ls -a'
alias l='ls -lh'
alias la='ls -alh'
alias ll='la'

# other
alias c='clear;'
alias :q='exit'
alias v='vim'
alias vi='vim'

# agent
alias agent='eval $(ssh-agent -s)'

# prompt
export PS1="\n[\u@${red_revert}\h${reset}${bright_black} \w${reset}] ${bright_black}# ${reset}"
