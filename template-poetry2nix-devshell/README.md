nix flake new -t github:numtide/devshell template-poetry2nix-devshell
cd template-poetry2nix-devshell
direnv allow
echo '[[commands]]\npackage = "poetry"' >> devshell.toml
