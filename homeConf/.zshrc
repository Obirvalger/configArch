HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

#zstyle ':prompt:grml:left:setup' items change-root user at host path vcs percent

unsetopt PRINT_EXIT_VALUE

alias cp='cp -vr'
alias mv='mv -v'
alias rm='rm -v'
alias ln='ln -v'
alias mkdir='mkdir -p -v'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sudo="sudo -E"
alias du0='du -h --max-depth=0'
alias du1='du -h --max-depth=1 | sort -h'
#alias pacman='sudo pacman'
alias maxima='rmaxima'
alias vzs='vim ~/.zshrc && source ~/.zshrc'
alias ys='yaourt -Ss'

export EDITOR="vim"

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
prompt off

if [ -f /usr/bin/grc ]; then
 alias gcc="grc --colour=auto gcc"
 alias irclog="grc --colour=auto irclog"
 alias log="grc --colour=auto log"
 alias netstat="grc --colour=auto netstat"
 alias ping="grc --colour=auto ping"
 alias proftpd="grc --colour=auto proftpd"
 alias traceroute="grc --colour=auto traceroute"
fi

autoload -U colors && colors
PS1='%F{4}[%F{6}%i%F{4}] %F{0}%B%T%b %F{2} %~%f %# ' #'%F{3}$(git branch 2> /dev/null | sed -r s/.//)%f %# '
#PS1='$LINENO'
RPROMPT="%(?..%F{red}%?)"
setopt promptsubst
ex () {
 if [ -f $1 ] ; then
   case $1 in
     *.tar.bz2) tar xvjf $1   ;;
     *.tar.gz)  tar xvzf $1   ;;
     *.tar.xz)  tar xvfJ $1   ;;
     *.bz2)     bunzip2 $1    ;;
     *.rar)     unrar x $1    ;;
     *.gz)      gunzip $1     ;;
     *.tar)     tar xvf $1    ;;
     *.tbz2)    tar xvjf $1   ;;
     *.tgz)     tar xvzf $1   ;;
     *.zip)     unzip $1      ;;
     *.Z)       uncompress $1 ;;
     *.7z)      7z x $1       ;;
     *)         echo "'$1' Не может быть распакован при помощи >ex<" ;;
   esac
 else
   echo "'$1' не является допустимым файлом"
 fi
}

pk () {
if [ $1 ] ; then
case $1 in
tbz)       tar cjvf $2.tar.bz2 $2      ;;
tgz)       tar czvf $2.tar.gz  $2       ;;
tar)      tar cpvf $2.tar  $2       ;;
bz2)    bzip $2 ;;
gz)        gzip -c -9 -n $2 > $2.gz ;;
zip)       zip -r $2.zip $2   ;;
7z)        7z a $2.7z $2    ;;
*)         echo "'$1' не может быть упакован с помощью pk()" ;;
esac
else
echo "'$1' не является допустимым файлом"
fi
}

gp () {
    msg=$(date +"%x %X")
    brn=$(git rev-parse --abbrev-ref HEAD)
    if [ $1 ]; then
        msg=$1
    fi
    if [ $2 ]; then
        brn=$2
    fi
    
    zsh -c "git add -A; git commit -m \"$msg\"; git push origin $brn"

}

yi () {
    d=$(pwd)
    cd ~/builds
    yaourt -Ga $1
    cd $1
    makepkg -sri 
    cd $d
}
