# Elvish completion adapter

It is a BASH adapter.

Requirements:
* bash 4.2+
* elvish 0.17
* kubectl
* helm

## Install

```
epm:install github.com/ezh/elvish-bash-completion
```

Add to `rc.elv`
```
use github.com/ezh/elvish-bash-completion/git
use github.com/ezh/elvish-bash-completion/helm
use github.com/ezh/elvish-bash-completion/kubectl
```

## Aliases

Completer support aliases. It always replaces the first argument with `kubectl`

An example of adding `k` alias

```
fn k {|@arg|
  kubectl $@arg
}
edit:add-var k~ $k~

set edit:completion:arg-completer[k] = $kubectl:kubectl_completion~
```

## Performance

Getting a root level hint on my laptop.

```
e:time elvish kubectl_completion.elv kubectl ""
▶ alpha
▶ annotate
▶ api-resources
▶ api-versions
▶ apply
▶ attach
▶ auth
▶ autoscale
▶ certificate
▶ cluster-info
▶ completion
▶ config
▶ cordon
▶ cp
▶ create
▶ debug
▶ delete
▶ describe
▶ diff
▶ drain
▶ edit
▶ exec
▶ explain
▶ expose
▶ get
▶ help
▶ kustomize
▶ label
▶ logs
▶ options
▶ patch
▶ plugin
▶ port-forward
▶ proxy
▶ replace
▶ rollout
▶ run
▶ scale
▶ set
▶ taint
▶ top
▶ uncordon
▶ version
▶ wait

0.13 real
0.11 user
0.03 sys
```

Not bad?

## State

I hope that Elvish will be 1st class citizen among other shells, and Kubectl/Cobra will natively support it.
Until then, I created an adapter to bash completer that is better than nothing. Ezh.

### External resources

* [bash_completion](https://github.com/scop/bash-completion/blob/master/bash_completion) GPLv2
* [git-completion.bash](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash) GPLv2

## License

[MIT License](https://choosealicense.com/licenses/mit/)

