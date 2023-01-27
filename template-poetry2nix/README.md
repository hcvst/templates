Python Poetry projects with Nix
===============================

See https://www.tweag.io/blog/2020-08-12-poetry2nix/.

Setup Steps
-----------
- Create temporary shell with `nix-shell -p poetry`.
- Create new Python project with `poetry mew myapp`.
- Exit temporary shell.
- Change into `myapp` directory.
- Create `shell.nix` with Python and poetry dependencies (see Nix section below).
- Optionally enable `direnv` with `echo use nix > .envrc && direnv allow`. 
- Add default.nix (see Nix section below).
- Use `nix-build` to build project.

Poetry Commands
---------------
- `poetry add requests flake` - add dependencies.
- `poetry shell` - enter project shell.
- `poetry run scriptname` - run script from config.
- `poetry install` - install an existing poetry based project.

Poetry Scripts
--------------
```
[tool.poetry.scripts]
myapp = 'myapp:main
```

Can be run with `poetry run myapp` as per the Poetry Commands above.

Nix
---

```{shell.nix}
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  buildInputs = [
    pkgs.python3
    pkgs.poetry
  ];
}
```

```{default.nix}
{ pkgs ? import <nixpkgs> {} }:

pkgs.poetry2nix.mkPoetryApplication {
  projectDir = ./.;
}
```

Heredoc Reminder
----------------

```{.sh}
cat << EOF > my.nix
 ..
EOF
```

