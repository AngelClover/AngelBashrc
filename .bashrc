# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

classpath=/usr/lib/java:/usr/share/java

LD_LIBRARY_PATH=/usr/local/lib/:/usr/lib/x86_64-linux-gnu/:/usr/lib/
PATH=$PATH:~/bin/:/usr/bin/java:/usr/bin/X11/java/:~/Developer/homebrew/bin:/usr/bin/:/Applications/
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cp='cp -v'
alias gvim='gvim -f'

alias l1='tree -L 1'
alias l2='tree -L 2'
alias l3='tree -L 3'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
ARTISTIC_STYLE_OPTIONS=~/.astylerc
alias astyle="astyle --pad-first-paren-out --style=kr --convert-tabs --indent=spaces=4 --add-brackets --pad-header --unpad-paren --pad-oper --max-code-length=100 --formatted --align-pointer=type --align-reference=type"

alias cdes="cd ~/git/elasticsearch-fordoc/src/main/java/org/elasticsearch/"

alias cppgrep="find . -name *.cpp | xargs grep -nH"
alias hgrep="find . -name *.h | xargs grep -nH"
alias codegrep="find . -name \"*.h\" -or -name \"*.cpp\" -or -name \"*.py\" -or -name \"*.conf\" -or -name \"*.php\" -or -name \"*.js\" | grep -v html| xargs grep -nH"
alias makegrep="find . -name \"Makefile\" -or -name \"makefile\" -or -name \"*.make\" | xargs grep -nH"
alias idlgrep="find . -name \"*.idl\" -or -name \"*.h\" | xargs grep -nH"
alias vigrep="find . -name \"*.vim\" | xargs grep -nH"
alias jsgrep="find . -name \"*.js\" -or -name \"*.html\" -or -name \"*.vue\" | xargs grep -nH"


export GREP_OPTIONS=' --color=auto'
export GREP_COLOR='1;31'

export TRUNK='https://svn.baidu.com/ps/se/trunk'
export BRANCH='https://svn.baidu.com/ps/se/branches'
export MYSPACE='https://svn.baidu.com/myspace/ps/changhaozhe'
export SVN_EDITOR='vim'
#export LANG=' zh_CN.UTF-8'

#git config --global user.name changhaozhe
#git config --global user.email changhaozhe@baidu.com

#颜色
git config --global color.ui auto
#git log会骗人，无法展示出版本（commit）之间的演进关系，用这个替代log
git config --global alias.tree 'log --graph --decorate --pretty=oneline --abbrev-commit'

git config --global merge.tool /usr/bin/vimdiff
git config --global core.editor /usr/bin/vim
alias firefox='open /Applications/Firefox.app'

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home/"
export CLASS_PATH="$JAVA_HOME/lib/"
PATH=".:$PATH:$JAVA_HOME/bin/"
alias seta="pwd > ~/.patha"
alias setb="pwd > ~/.pathb"
function vid(){
[[ ! -n ${1} ]] && return; 
#[[-f ~/.patha]] || return;
#[[-f ~/.pathb]] || return;
    echo ${1};
    cat ~/.patha;
    cat ~/.pathb;
    pa=`cat ~/.patha;`;
    pb=`cat ~/.pathb;`;
    echo $pa, $pb;
    echo $pa/${1}, $pb/${1};
    vi -d $pa/${1} $pb/${1};
}
export HOMEBREW_CELLAR="/usr/local/Cellar"

alias githis="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"

