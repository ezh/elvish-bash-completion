source $1/bash_completion && source $1/git-completion.bash
shift

COMP_CWORD=$1
shift

declare COMP_WORDS
COMP_WORDS=("$@")

COMPREPLY=()
COMP_WORDBREAKS=$'\n''"'"'"'><=;|&(:'
COMP_LINE="$@"
COMP_POINT=${#COMP_LINE}
__git_wrap__git_main 2>/dev/null # elvish is looking for StdErr also
if [ "${#COMPREPLY[@]}" -eq 0 ]; then
  ls -1
else
  printf '%s\n' "${COMPREPLY[@]}"
fi