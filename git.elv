use str
use path

var rc_dir = (path:dir (src)[name])

fn git_completion {|@cmd|
  if (eq $cmd []) {
    return
  }
  # The fix allowing to use aliases with this function
  set cmd[0] = git

  var completions = [( bash --norc --noprofile $rc_dir/adapter_git.sh $rc_dir (- (count $cmd) 1) $@cmd | from-lines | each {|n| str:trim-space $n} )]
  var prefix = $cmd[-1]
  if (eq $prefix '') {
    put $@completions
  } else {
    if (not-eq $@completions []) {
      if (eq [] (each {|n| if (str:has-prefix $n $prefix) { put $n }} $completions)) {
        # no shared prefix
        # for example kubectl --namespace= will return list of namespaces
        # we should add --namespace= prefix to each completion
        each {|n| put $prefix$n} $completions
      } else {
        put $@completions
      }
    }
  }
}

set edit:completion:arg-completer[git] = $git_completion~
