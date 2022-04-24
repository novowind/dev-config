PROMPT="%{$fg_bold[magenta]%}%n%{$fg[blue]%}@%{$fg_bold[yellow]%}%m"
PROMPT+=' %{$bg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'
NEWLINE=$'\n'
PROMPT+="${NEWLINE}%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
