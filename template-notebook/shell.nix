{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name="python-venv";
  buildInputs = [
    pkgs.python39
    pkgs.python39Packages.ipython
    pkgs.python39Packages.ipykernel
  ];
  shellHook = ''
    activation_script=./.venv/bin/activate
    test -f $activation_script || python3.9 -m venv .venv
    source $activation_script
    echo $(tput setab 4)iPython venv environment loaded!$(tput sgr0) 
  '';
}
