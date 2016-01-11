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

alias node='docker run $DOCKER_NODE_OPTS --rm -ti -v $(pwd):/usr/src/app -e USER=1000 joxit/node node'
alias npm='docker run $DOCKER_NODE_OPTS --rm -ti -v $(pwd):/usr/src/app -e USER=1000 joxit/node npm'

