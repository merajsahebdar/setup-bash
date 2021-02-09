# vim:set ts=4 sw=4 et tw=100: expandtab

#
# ~/.bash_profile
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:$HOME/.yarn/bin"

if [[ "$OSTYPE" == "darwin"* ]]; then
    # linuxify env
    . "$HOME/.linuxify"

    # source system profile
    [[ -f /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh
    [[ -f /usr/local/etc/profile.d/git-prompt.sh ]] && . /usr/local/etc/profile.d/git-prompt.sh
elif [[ "$OSTYPE" == "linux-gnu"*  ]]; then
    [[ -f /etc/profile ]] && . /etc/profile

    export PATH="$PATH:$HOME/.local/bin:/var/lib/snapd/snap/bin"
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # we have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='[\[\033[36m\]μ\[\033[00m\] \[\033[35m\]\W\[\033[00m\]]$(declare -F | grep -q __git_ps1$ && __git_ps1 "[%s]")$ '
else
    PS1='[μ \W]\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u at \h:\W\a\]$PS1"
    ;;
*)
    ;;
esac

# personaly prefer to define all aliases in a seperate file
if [ -f "$HOME/.bash_aliases" ]; then
    . "$HOME/.bash_aliases"
fi

export EDITOR="nvim"

# other stuff ...
export GPG_TTY=$(tty)
