
function color_my_prompt {
  #Uhhhh User and Host
  local __user_and_host="\[\033[01;32m\]\u@\h"
  #Current directory path
  local __cur_location="\[\033[01;30m\]\w"
  #Color for git branches
  local __git_branch_color="\[\033[37m\]"
  #Local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
  local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  #Nuke it all :)
  local __prompt_tail="\[\033[38;5;214m\]☢"
  #Color for typed commands
  local __last_color="\[\033[00m\]"
  #Original for reference
  #export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "

  #Build the prompt structure
  export PS1="$__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

#colorize output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


#I'm a noob and forgot what this does precisely b/c I don't totally understand PATH
export PATH=/usr/local/bin:$PATH

alias ls="ls -GpFh"
alias ll="ls -la"

alias vmode="set -o vi"
alias emode="set -o emacs"

#Work folder alias
alias getable="cd ~/repos/getable/constructable"
#Easy access to this file
alias bashpro="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ~/.bash_profile"
#So I can open stuff in Sublime from cmd line
alias st3="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

#kill stuff sitting on port:8080
alias ghostbuster="lsof -n -i4TCP:8080 | grep LISTEN"


#make git autocompletion work
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#Default node dev ENV for Getable
export NODE_ENV="local"


#Color reference
#A foreground color in yellow: \[\033[38;5;214m\]
#A BG color in yellow          \[\033[48;5;214m\]
function printColors {
  color=16;
  while [ $color -lt 245 ]; do
      echo -e "$color: \\033[38;5;${color}mhello\\033[38;5;232m\\033[48;5;${color}mworld\\033[0m"
      ((color++));
  done
}


function scolors {
  color=16;
  while [ true ]; do

    sleep 0.010
    #yes = | head -n$(($(tput lines) * $COLUMNS)) | tr -d '\n'

    X = $(yes = | head -n$(($(tput lines) * $COLUMNS)) | tr -d '\n');
    echo -e "$color: \\033[48;5;${color}m ${X} \\033[0m"
    ((color++));
    #if [$color == 245];
    #if [$color == 16];
  done
}


#Original for reference
#function color_my_prompt {
#    local __user_and_host="\[\033[01;32m\]\u@\h"
#    local __cur_location="\[\033[01;34m\]\w"
#    local __git_branch_color="\[\033[31m\]"
#    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
#    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
#    local __prompt_tail="\[\033[35m\]$"
#    local __last_color="\[\033[00m\]"
#    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
#}
#color_my_prompt
