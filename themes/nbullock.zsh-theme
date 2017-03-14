local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"
PROMPT='  ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# This here makes zsh vi-mode much better.
PS1=$PROMPT # You'd prob'ly want a less minimalist PS1 tho.
function zle-line-init zle-keymap-select {
 case $KEYMAP in
 vicmd)
  PS1=-${PS1#?}
 ;;
 main)
  PS1=I${PS1#?}
 ;;
 '*')
  PS1=?${PS1#?}
 esac
 zle reset-prompt
}
bindkey -v
zle -N zle-keymap-select
zle -N zle-line-init
KEYTIMEOUT=1
