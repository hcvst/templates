{ pkgs ? import <nixpkgs> {}
}:

pkgs.mkShell {
  name="jdg-dev";
  buildInputs = [
    pkgs.python39
    pkgs.python39Packages.ipykernel
    pkgs.python39Packages.pyspark
    pkgs.python39Packages.pandas
    pkgs.python39Packages.base58
    # pkgs.python39Packages.boto3
    pkgs.jdk8
    pkgs.python39Packages.ipython
  ];
  PYSPARK_DRIVER_PYTHON = "ipython";
  AWS_CA_BUNDLE = "/etc/ssl/certs/ca-certificates.crt";
  shellHook = ''
    echo "JDG Dev"
    # source ./.venv/bin/activate #this was created with python -m venv .venv inside the shell environment once
  '';
}
