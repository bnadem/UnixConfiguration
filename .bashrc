# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
    xterm-color|*-256color) color_prompt=yes;;
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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

. "$HOME/.cargo/env"
export VISUAL=vim;
export EDITOR=vim;

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

  # cd /home/tree/projects/java
                             # tmux send-keys -t website:0.0 'cd "${rootDirectory}"' Enter

 # alias tmux="TERM=screen-256color-bce tmux"
alias back_front=bf
alias rust_dev=jt
rust_dev(){
    rootDirectory='/home/farka01/Desktop/challenges/zero-to-production'
    # if the session called exactly 'backend_frontend' exist
    if ! tmux has-session -t=jt; then
        # if it does not exist
        # create a new session (new -s) called 'jt' detached (-d flag)
        tmux new -s jt -d
        # send-keys (change directory command) in the 0th window and 0th pane
        # first windows open vim with two tabnew
        tmux split-window -v -t jt:0.0
        tmux send-keys -t jt:0.0 'cd '${rootDirectory}'' Enter
        tmux send-keys -t jt:0.0 'ranger' Enter
        tmux split-window -p 20 -h -t jt:0.0
        tmux send-keys -t jt:0.1 'htop' Enter

        # split the 0th pane of the 0th window of the 'jt' vertically
        tmux split-window -h -t jt:0.2
        # stop docker database and redis, and remove it in forth pane
        # tmux send-keys -t jt:0.3 'docker stop $(docker ps -a | grep postgre | awk ''{print $1}'') ' Enter
        # tmux send-keys -t jt:0.3 'docker stop $(docker ps -a | grep redis | awk ''{print $1}'') ' Enter
        # tmux send-keys -t jt:0.3 'docker rm $(docker ps -a | grep postgre | awk ''{print $1}'') ' Enter
        # tmux send-keys -t jt:0.3 'docker rm $(docker ps -a | grep redis | awk ''{print $1}'') ' Enter
docker stop $(docker ps -a | grep postgre | awk '{print $1}')
docker stop $(docker ps -a | grep redis | awk '{print $1}')
docker rm $(docker ps -a | grep postgre | awk '{print $1}')
docker rm $(docker ps -a | grep redis | awk '{print $1}')
        tmux send-keys -t jt:0.3 'cd '${rootDirectory}'' Enter
        tmux send-keys -t jt:0.3 'scripts/init_db.sh' Enter
        tmux send-keys -t jt:0.3 'scripts/init_redis.sh' Enter
        # tmux send-keys -t jt:0.3 'htop' Enter
        # run in third pane
        tmux send-keys -t jt:0.2 'cd '${rootDirectory}'' Enter
        tmux send-keys -t jt:0.2 'cargo watch -x run' Enter
        # tmux send-keys -t jt:0.2 'htop' Enter
    fi

         # attach to the session called 'bf'
         tmux a -t=jt
     }
back_front()
{
    rootDirectory='/home/farka01/Desktop/working'
    backend="${rootDirectory}/REO_BACKEND"
    frontend="${rootDirectory}/frontend_rdc40"
    # if the session called exactly 'backend_frontend' exist
    if ! tmux has-session -t=bf; then
        # if it does not exist
        # create a new session (new -s) called 'bf' detached (-d flag)
        tmux new -s bf -d
        # send-keys (change directory command) in the 0th window and 0th pane
        # first windows open vim with two tabnew
        tmux split-window -v -t bf:0.0
        tmux send-keys -t bf:0.0 'cd '${rootDirectory}'' Enter
        tmux send-keys -t bf:0.0 'vim -p '${backend}'/ReoBackendIndustry4_0.cpp '${frontend}'/src/app/home/home.component.ts' Enter
        # tmux send-keys -t bf:0.0 'vim  -p "'${backend}'/ReoBackendIndustry4_0.cpp"'  Enter
        tmux split-window -p 20 -h -t bf:0.0
        tmux send-keys -t bf:0.1 'htop' Enter

        # split the 0th pane of the 0th window of the 'bf' vertically
        tmux split-window -h -t bf:0.2
        tmux send-keys -t bf:0.2 'cd "${backend}"' Enter
        pathServerExe="${backend}/build/Release/bin/RDC4.0"
        tmux send-keys -t bf:0.2 "${pathServerExe}" Enter
        # tmux send-keys -t bf:0.1 "ls" Enter
        # run hugo server there
        # tmux send-keys -t bf:0.1 'hugo serve -e production -D -F' Enter
        # run angular frontend server
        tmux send-keys -t bf:0.3 'cd '${frontend}'' Enter
        tmux send-keys -t bf:0.3 'ng serve' Enter
    fi

         # attach to the session called 'bf'
         tmux a -t=bf
     }

