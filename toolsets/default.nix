{inputs, ...}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: let
    lib = import ./lib.nix;
    args = {inherit pkgs system inputs;};

    toolsets = {
      inherit lib;
      base = import ./base.nix args;
      rust = import ./rust.nix args;
      go = import ./go.nix args;
      nodejs = import ./nodejs.nix args;
      python = import ./python.nix args;
      lua = import ./lua.nix args;
      zig = import ./zig.nix args;
      java = import ./java.nix args;
      nix = import ./nix.nix args;
      thrift = import ./thrift.nix args;
    };
  in {
    _module.args.toolsets = toolsets;

    legacyPackages.toolsets = toolsets;
  };
}
