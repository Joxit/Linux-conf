# Typos
alias cd..='cd ..'
alias cd.='cd ..'

# Prompt before overwrite
alias mv='mv -i'
alias cp='cp -i -p'
alias ln='ln -i'

# ls with long time sorted
alias llt='ls -l --time-style=long -t'

# Infos
alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'

# gui diff and merge tool
alias diffk="meld"

alias ttfb='curl -o /dev/null -s  -w "Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n"'

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
