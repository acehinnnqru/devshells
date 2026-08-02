{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    devshells = {
      url = "github:acehinnnqru/devshells";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    utils,
    devshells,
    ...
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        ts = devshells.legacyPackages.${system}.toolsets;
        inherit (ts.lib) combine mkShellArgs;
      in {
        devShells.default = pkgs.mkShell (mkShellArgs (combine [
          ts.base

          ## Rust
          # ts.rust.stable
          # ts.rust.nightly
          # ts.rust.nightly-wasm

          ## Go
          # ts.go.latest
          # ts.go."1_25"
          # ts.go."1_24"

          ## Node.js
          # ts.nodejs."22"

          ## Python
          # ts.python."314"
          # ts.python."313"
          # ts.python."311"

          ## Zig
          # ts.zig.default
          # ts.zig.latest

          ## Lua
          # ts.lua.default

          ## Java
          # ts.java.android

          ## Thrift
          # ts.thrift.default

          ## Project-specific
          {
            packages = with pkgs; [
              # add your packages here
            ];
            # shellHook = ''echo "hello"'';
          }
        ]));
      }
    );
}
