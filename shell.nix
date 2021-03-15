with import <nixpkgs> {};

(python27.buildEnv.override {
  extraLibs = [ python27Packages.numpy pythonPackages.matplotlib ];
  ignoreCollisions = true;
}).env
