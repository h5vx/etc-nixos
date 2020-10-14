{ pkgs ? import <nixpkgs> {} }: with pkgs;

rec {

  mcabber-editor = callPackage ./mcabber-editor {};

}
