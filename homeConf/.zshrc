HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

bindkey -e

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export fpath=($fpath ~/.zsh/completions)

export PATH=$PATH:~/go/bin:~/perl5/bin:~/bin:~/.local/bin:~/.cabal/bin:~/.gem/ruby/2.4.0/bin:/usr/local/bin:/opt/rakudo-star-2016.10/bin:/opt/rakudo-star-2016.10/share/perl6/site/bin

PERL5LIB=~/perl5/lib/perl5
export PERL5LIB

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

zstyle ':completion:*' rehash true
#zstyle ':prompt:grml:left:setup' items change-root user at host path vcs percent
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/scripts/antigen/antigen.zsh
#antigen use oh-my-zsh

unsetopt correct_all
setopt correct
#setopt cdable_vars
#setopt autocd
#sprompt="zsh: correct '%r' to '%r'? [nyae]?"
setopt interactivecomments
setopt noclobber
setopt nohup
setopt no_check_jobs
setopt hist_ignore_all_dups
setopt extended_history
unsetopt share_history
setopt hist_ignore_space

autoload -U zmv
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
alias help=run-help

autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# ctrl-v + arrow to find exact key code

bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

#export LS_COLORS='di=38;5;108:fi=00:ln=38;5;116:ex=38;5;186'
#export LSCOLORS='ExGxFxdxCxEgEdHbagacad'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
zstyle ':completion:*' menu select
autoload -U zcalc
autoload -Uz compinit promptinit
autoload -U colors zsh/terminfo
colors
compinit
promptinit
prompt off
autoload -U colors && colors
if [[ $HOST == home ]]
then
    PS1='%F{5}[%F{4}%B%2c%b%F{5}]%f %#%b '
else
    PS1='%F{3}{%m} %F{5}[%F{4}%B%2c%b%F{5}]%f %#%b '
fi
#RPROMPT="%(?..%F{red}%?)"
#setopt promptsubst

alias -s {pm,txt}=vim

alias -g ...='../..'
alias -g ....='../../..'
alias -g D='2> /dev/null'
alias -g BG='&; sleep 1; exit' 
alias -g L='| less'
alias -g G='| grep -n '
#alias -g GI='|grep -i'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g SU='|sort -u'
alias -g C='| wc -l'
alias -g V='|& vim -'
alias -g H='| head'
alias -g H1='| head -n1'
alias -g H2='| head -n2'
alias -g N='| nl -ba'

if [[ -f /usr/bin/vimx ]]
then
    #echo lol
    alias vim='vimx -p'
else
    #echo lil
    alias vim='vim -p'
fi

#alias man='man --prompt=""'
alias vims='gear-edit-spec'
alias gti='git'
alias pe='perl -pe'
alias cp='cp -Lvir'
alias mv='mv -vi'
alias rm='rm -v'
alias ln='ln -v'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias l='ls -alF'
alias mkdir='mkdir -p -v'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sudo="sudo -E "
alias du0='du -h --max-depth=0'
alias du1='du -h --max-depth=1 | sort -h'
alias df='df -h'
alias nl='nl -ba'
#alias pacman='sudo pacman'
alias maxima='rmaxima'
alias vzs='vim ~/.zshrc && source ~/.zshrc'
alias pltags='/usr/share/vim/vim80/tools/pltags.pl'
#alias ys='yaourt -Ss'
#alias sage='nice sage'
#alias perl6='rlwrap perl6'

export EDITOR="vim"
export PYTHONSTARTUP=~/.pythonrc

export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode    
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

mgrep () {
    egrep $1 ./* -Ri
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;34m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[01;33;40m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[01;04;35m' \
    man "$@"
}


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

math () {
    perl -Mbignum -le "print $1"
}

githubAdd () {
    if (($# != 2)); then
        echo "Using: $0 <username> <reponame>"
    else
        curl -u "$1" https://api.github.com/user/repos -d {\"name\":\"$2\"}
        git remote add origin git@github.com:${1}/${2}.git
        git push origin master
    fi
}

hist () {
    if [ $1 ]; then
        n=$1
    else
        n=10
    fi

    fc -lndD -$n
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
    yaourt --noconfirm --m-arg "--skipchecksums" --m-arg "--skippgpcheck" -Sb $1
}

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

build_hosts=(work port)
if [[ -d ~/tmp && ${build_hosts[(r)$HOSTNAME]} ]]
    then mkdir ~/tmp/hasher
fi
