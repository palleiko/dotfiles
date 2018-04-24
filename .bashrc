# colors
COLG="\[\033[0;32m\]" # green
COLC="\[\033[0;36m\]" # cyan
COLY="\[\033[0;33m\]" # yellow
COLB="\[\033[0;34m\]" # blue
COLP="\[\033[0;35m\]" # purple
COLR="\[\033[0;31m\]" # red
COLN="\[\033[0m\]"	  # Reset

set -o vi

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


# user colors
COL="$COLC"						# noraml user color
[[ "$UID" = "0" ]] && COL=$COLR	# red for root

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS -l'
export GREP_COLOR="1;31"
alias grep='grep --color=auto'
export G="https://github.com"


PS1="$COLR\u@\h$COLB [\w]$COLG\$(parse_git_branch) $COLN\$ "

export EDITOR="vim"
export BROWSER="firefox"
alias cl='clear'
alias fucking='sudo'
alias ..='cd ..'
alias 'cd..'='cd ..'
alias 'cd'='cd'
alias reboot="sudo /sbin/reboot"
alias :q=exit
alias lsa='ls -la'
alias ida='wine /home/ian/.wine/drive_c/Program\ Files\ \(x86\)/IDA\ 6.8/idaq64.exe & disown'
alias term='urxvt & disown'

base16_google-dark

export ANDROID_HOME=/opt/android-sdk
