unset all_proxy; unset ALL_PROXY
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

if ([ -f ~/.zshrc.local ]) {
    source ~/.zshrc.local
}

fpath=(~/.zsh/completion $fpath)

export LANG=C.UTF-8

bindkey -e

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# do not remove space after | and & chars
export ZLE_SPACE_SUFFIX_CHARS=$'|&'

if [ -z $GOPATH ]; then
    export GOPATH=/usr/share/gocode
else
    if [ -d "$HOME/go" ]; then
        export GOPATH="$HOME/go:$GOPATH"
    fi
fi

export PATH=$PATH:~/go/bin:~/perl5/bin:~/bin:~/.local/bin:/usr/local/bin:/usr/sbin:/sbin:/usr/share/gocode/bin/

PERL5LIB=~/perl5/lib/perl5
export PERL5LIB

export GOOGLER_COLORS=Ecgbxy


[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

zstyle ':completion:*' rehash true
#zstyle ':prompt:grml:left:setup' items change-root user at host path vcs percent
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/scripts/antigen/antigen.zsh
#antigen use oh-my-zsh

unsetopt correct_all
setopt histignorespace
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
setopt hist_save_no_dups
setopt inc_append_history
unsetopt share_history
setopt hist_ignore_space

autoload -U zmv
autoload -U edit-command-line
HELPDIR="/usr/share/zsh/$ZSH_VERSION/help/"
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
alias help=run-help

autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N edit-command-line

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
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion::complete:*' use-cache 1
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

alias -g ....='../../..'
alias -g ...='../..'
alias -g AU="| awk '!a[\$0]{print} {a[\$0]=1}'"
alias -g BG='&; sleep 1; exit'
alias -g C='| wc -l'
alias -g D='2> /dev/null'
alias -g G='| grep '
alias -g GI='| grep -i '
alias -g GIN='| grep -ni '
alias -g GN='| grep -n '
alias -g GV='| grep -v '
alias -g H1='| head -n1'
alias -g H2='| head -n2'
alias -g H='| head'
alias -g L='|& less'
alias -g LJ='| jq -C | less'
alias -g N='| nl -ba'
alias -g S='| sort'
alias -g SC='| sort | uniq -c | sort -k1,1n '
alias -g SU='|sort -u'
alias -g T='| tail'
alias -g V='|& vim -'
alias -g VGO='|& vim - -c "set ft=go"'
alias -g VPL='|& vim - -c "set ft=perl"'
alias -g VPY='|& vim - -c "set ft=python"'
alias -g VRB='|& vim - -c "set ft=ruby"'
alias -g VSH='|& vim - -c "set ft=sh"'

if [[ -f /usr/bin/vimx ]]
then
    #echo lol
    alias vim='vimx -p'
else
    #echo lil
    alias vim='vim -p'
fi

#alias man='man --prompt=""'
alias osb='openstack --os-cloud basealt'
alias g2s='github2spec --no-empty-branch'
alias vbm='VBoxManage'
alias perldoc='perldoc -M Pod::Perldoc::ToMan'
alias googler='googler -n 7'
alias vims='gear-edit-spec -p'
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
# [ -s ~/.pythonrc ] && export PYTHONSTARTUP=~/.pythonrc

export LESS=FRSX
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;02;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;00;36m'
export GROFF_NO_SGR=1 # For gnome-terminal and konsole in fedora and opensuse

vimp () {
    local TOGGLE_MOD_OPTION="-c call TogglePagerMode()"
    if [ $# = 0 ]; then
        vim $TOGGLE_MOD_OPTION -
    else
        vim $TOGGLE_MOD_OPTION $1
    fi
}

sjo () {
    [ $1 ] && c="tmux a -t $1" || c=
    b=balt
    ssh -Atto ProxyCommand="ssh $b nc obirvalger 22" obirvalger $c
}

sja () {
    [ $1 ] && c="tmux a -t $1" || c=
    b=balt
    ssh -Atto ProxyCommand="ssh $b nc altair 22" altair $c
}

sjb () {
    [ $1 ] && c="tmux a -t $1" || c=
    b=balt
    ssh -Att $b $c
}

sjt () {
    [ $1 ] && c="tmux a -t $1" || c=
    b=tilaa
    ssh -Att $b $c
}

.proxy () {
    local port=5555
    local pid="$(lsof -i :"$port" | awk '/^ssh/{p=$2}END{print p}')"
    if [ -n "$pid" ]; then
        kill "$pid"
    fi
    ssh -D"$port" -fN tilaa
}

.ssh () {
    source ~/o.ssh
}

mgrep () {
    egrep $1 ./* -Ri
}

anypeek () {
    PEEK_TEMPLATE="$1" # e.g. "tar -xf %s -C %s"
    FILE="$2"
    PROG="${3:-$SHELL}"

    WORKDIR="$(mktemp -dt anypeek-XXXXXX)"
    (
        $(printf "$PEEK_TEMPLATE" "$FILE" "$WORKDIR") ||:
        cd "$WORKDIR"
        "$PROG"
    )
    rm -rf "$WORKDIR"
}

tarpeek () {
    FILE="$1"
    PROG="${2:-$SHELL}"

    WORKDIR="$(mktemp -dt tarpeek-XXXXXX)"
    (
        tar -xf "$FILE" -C "$WORKDIR" ||:
        cd "$WORKDIR"
        "$PROG"
    )
    rm -rf "$WORKDIR"
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

qm () {
    IMAGES_DIR=~obirvalger/vms/out
    IMAGE="${1?Pass image!}"
    PROG="${2:-$SHELL}"
    case $IMAGE in
        # absolute
        /*) :;;
        # relative
        *) IMAGE="$IMAGES_DIR/$IMAGE"
    esac
    qemu-nbd --connect=/dev/nbd0 "$IMAGE"
    mount /dev/nbd0p1 /mnt
    (
        cd /mnt
            $PROG
    )
    umount /mnt
    qemu-nbd --disconnect /dev/nbd0
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

if [ -e ~/hasher ]; then
    mkdir $TMP/hasher
fi

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

set -B

# opam configuration
# test -r /home/obirvalger/.opam/opam-init/init.zsh && . /home/obirvalger/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
