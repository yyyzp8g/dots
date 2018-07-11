# use bash-completion if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# source prompt
[[ $PS1 && -f ~/.bash/.bash_prompt ]] && . ~/.bash/.bash_prompt

# source alias
[[ -f ~/.bash/.bash_alias ]] && . ~/.bash/.bash_alias

# source environmental variables
[[ -f ~/.bash/.bash_env ]] && . ~/.bash/.bash_env

# source setting
[[ -f ~/.bash/.bash_setting ]] && . ~/.bash/.bash_setting
