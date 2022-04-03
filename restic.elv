use str
use path

var rc_dir = (path:dir (src)[name])

fn restic_completion {|@cmd|
  if (eq $cmd []) {
    return
  }
  # The fix allowing to use aliases with this function
  set cmd[0] = restic

  var completions = [( bash --norc --noprofile $rc_dir/adapter_restic.sh $rc_dir (- (count $cmd) 1) $@cmd | from-lines | each {|n| str:trim-space $n} )]
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

#restic_completion $@args
set edit:completion:arg-completer[restic] = $restic_completion~
