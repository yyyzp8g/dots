# use antigen
source ~/.zsh/antigen.zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# history substring search
antigen bundle zsh-users/zsh-history-substring-search

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# ready
antigen apply

# custom env
source ~/.zsh/.zsh_env

# custom alias
source ~/.zsh/.zsh_alias

# custom prompt
source ~/.zsh/.zsh_prompt

# custom setting
source ~/.zsh/.zsh_setting

