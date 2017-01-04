#!/bin/zsh

upsearch () {
  slashes=${PWD//[^\/]/}
  directory="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
    test -e "$directory/package.json" && echo "$directory/package.json" && return 
    directory="$directory/.."
  done
}

node_root () {
  if type "npm" > /dev/null; then
    pack_dir=$(upsearch)
    [[ !  -z  $pack_dir  ]] && node -e "console.log( '(' + require('$(upsearch)').name + ':' + require('$(upsearch)').version + ')');"
  else
  fi
}

PROMPT='%{$FG[010]%}%~ %{$fg[cyan]%}%n@%m %{$fg_bold[white]%}$(git_prompt_info)%{$reset_color%} %{$fg[yellow]%}$(node_root)%{$reset_color%}
$FG[244]%(!.#.λ)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} *%{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# export LSCOLORS="exfxcxdxbxegedabagacad"
# export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
