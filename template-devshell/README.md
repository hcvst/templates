See https://numtide.github.io/devshell/

```
nix flake new -t "github:numtide/devshell" project/

cd project/

# enter the shell
nix develop # or `direnv allow` if `direnv` is installed `e.g. home.nix programs.direnv..`
```
