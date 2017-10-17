export TDSDUMP=/tmp/freetds.log

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.

alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias which='type -all'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias print='/usr/bin/lp -o nobanner -d $LPDEST'   # Assumes LPDEST is defined
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'  # Pretty-print using enscript
alias background='xv -root -quit -max -rmode 5' # put a picture in the background
alias du='du -h'
alias df='df -kh'


# The 'ls' family (this assumes you use the GNU ls)
alias la='ls -al --color'       # add colors for filetype recognition
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
#alias la='ls -Al'               # show hidden files
alias lr='ls -lR'               # recursice ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al |more'         # pipe through 'more'
alias tree='tree -Cs'           # nice alternative to 'ls'

alias cls='clear;figlet "shameballers"'
alias cla='clear;figlet "shameballers"'
alias csl='clear;figlet "shameballers"'
alias ifconfig='sudo ifconfig'
alias apt='sudo apt-get install'
alias remove='sudo apt-get remove'
alias search='apt-cache search'
alias startdashboard='~/Projects/dashboard/dashboard/manage.py runserver 0:8000'
alias startcelery='supervisord -c ~/Projects/dashboard/etc/supervisord.conf'
alias startintranet=' foreman start -f ~/Projects/intranet/Procfile.dev'

alias svi='sudo vi'
alias ports='netstat -a | egrep "Proto|LISTEN"'

alias gaa='git add -A .'
alias gs='git status'
alias gas='git commit -am'
alias gc='git checkout'
alias gitsome='git submodule init && git submodule update'

alias foreman='honcho'

# tailoring 'less'
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-' # Use this if lesspipe.sh exists
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
#:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# spelling typos - highly personnal :-)
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

shopt -s extglob        # necessary
set +o nounset          # otherwise some completions will fail

complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
complete -A command    nohup exec eval trace gdb
complete -A command    command type which
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help     # currently same as builtins
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

complete -f -d -X '*.gz'  gzip
complete -f -d -X '*.bz2' bzip2
complete -f -o default -X '!*.gz'  gunzip
complete -f -o default -X '!*.bz2' bunzip2
complete -f -o default -X '!*.pl'  perl perl5
complete -f -o default -X '!*.ps'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X '!*.dvi' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.pdf' acroread pdf2ps
complete -f -o default -X '!*.+(pdf|ps)' gv
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex
complete -f -o default -X '!*.lyx' lyx
complete -f -o default -X '!*.+(jpg|gif|xpm|png|bmp)' xv gimp
complete -f -o default -X '!*.mp3' mpg123
complete -f -o default -X '!*.ogg' ogg123

shopt -s globstar
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

 # Load RVM into a shell session *as a function*
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

upinfo()
{
echo -ne "\t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}

PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\](\[\033[01;34m\]\w\[\033[00;34m\])\[\033[01;32m\]:\[\033[00m\]'
export PS1="${PS1%\\\$*}"' \t \$ '

export WORKON_HOME=$HOME/.virtualenv
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh 
export VIRTUALENV_DISTRIBUTE=true


# test=`ps -ef | grep ssh-agent | grep -v grep  | awk '{print $2}' | xargs`
#
#if [ "$test" = "" ]; then
#       # there is no agent running
#       if [ -e "$HOME/agent.sh" ]; then
#          # remove the old file
#          rm -f $HOME/agent.sh
#       fi;
#       # start a new agent
#       ssh-agent | grep -v echo >&$HOME/agent.sh 
#fi;

#test -e $HOME/agent.sh && source $HOME/agent.sh

#alias kagent="kill -9 $SSH_AGENT_PID"

if [ -e /lib/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

clear
#echo -e "${LIGHTGRAY}";figlet "fletch";
echo -e $(fortune) | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1); echo ""
echo -ne "${Red}Today is:\t\t${Cyan}" `date`; echo ""
echo -e "${Red}Kernel Information: \t${Cyan}" `uname -smr`
echo -ne "${Red}Uptime is: \t${Cyan}";upinfo;echo ""
echo -e "${Cyan}"; cal -3


function cd {
  builtin cd "$@" && la
}

/usr/bin/keychain $HOME/.ssh/id_rsa
source $HOME/.keychain/$HOSTNAME-sh
