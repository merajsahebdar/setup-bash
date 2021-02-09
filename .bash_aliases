# vim:set ts=4 sw=4 et tw=100: expandtab

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

# add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# linux only
if [[ "$OSTYPE" == "linux-gnu"*  ]]; then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

# force using neovim instead of vim if exists
DEFAULT_VIM_BIN=$(which vim)
vim() {
    if hash nvim 2>/dev/null; then
        nvim "$@"
    else
        eval "$DEFAUT_VIM_BIN $@"
    fi
}

# xdg-open shortcut
if [[ "$OSTYPE" == "linux-gnu"*  ]]; then
    alias open='xdg-open'
fi
