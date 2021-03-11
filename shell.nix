with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ pkgs.python27 pkgs.python27Packages.numpy pkgs.python27Packages.matplotlib ];
}
