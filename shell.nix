with import <nixpkgs> {};

pkgs.mkShell {
  buildInputs = [ packer qemu ];
}
