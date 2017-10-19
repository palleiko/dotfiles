# colors
COLV="\[\033[0;32m\]" # green
COLC="\[\033[0;36m\]" # cyan
COLA="\[\033[0;33m\]" # yellow
COLB="\[\033[0;34m\]" # blue
COLP="\[\033[0;35m\]" # purple
COLR="\[\033[0;31m\]" # red
COLN="\[\033[0m\]"	  # Reset

# user colors
COL="$COLC"						# noraml user color
[[ "$UID" = "0" ]] && COL=$COLR	# red for root

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS -l'
export GREP_COLOR="1;31"
alias grep='grep --color=auto'


PS1="\u@\h [\w] \$ "

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

export PATH="$PATH:$HOME/bin"

PATH=$PATH:/home/ian/010editor
export PATH
export ANDROID_HOME=/opt/android-sdk
