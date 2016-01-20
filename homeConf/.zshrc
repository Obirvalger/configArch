# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

unsetopt PRINT_EXIT_VALUE

zstyle :compinstall filename '/home/ogneslav/.zshrc'
zstyle ':completion:*' rehash true

alias cp='cp -vr'
alias mv='mv -v'
alias rm='rm -v'
alias ln='ln -v'
alias mkdir='mkdir -p -v'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sudo="sudo -E"
alias du='du -h --max-depth=0'
alias pacman='sudo pacman'

export EDITOR="vim"

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit
prompt grml

if [ -f /usr/bin/grc ]; then
 alias gcc="grc --colour=auto gcc"
 alias irclog="grc --colour=auto irclog"
 alias log="grc --colour=auto log"
 alias netstat="grc --colour=auto netstat"
 alias ping="grc --colour=auto ping"
 alias proftpd="grc --colour=auto proftpd"
 alias traceroute="grc --colour=auto traceroute"
fi

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
    echo "git add -A; git commit -m \"$msg\"; git push origin $brn"

}
