source $1/bash_completion && source <(kubectl completion bash)
shift

COMP_CWORD=$1
shift

COMPREPLY=()
COMP_WORDBREAKS='"'"'"'><=;|&(:'
COMP_LINE="$@"
COMP_WORDS=($COMP_LINE)
COMP_POINT=${#COMP_LINE}
__start_kubectl 2>/dev/null # elvish is looking for StdErr also
printf '%s\n' "${COMPREPLY[@]}"
