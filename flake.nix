{
  description = "Language-focused development shells";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig-overlay.url = "github:mitchellh/zig-overlay";

    nixpkgs-go125.url = "github:NixOS/nixpkgs/09061f748ee21f68a089cd5d91ec1859cd93d0be";
    nixpkgs-go124.url = "github:NixOS/nixpkgs/418468ac9527e799809c900eda37cbff999199b6";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      flake.templates.default = {
        description = "composable devshell template — uncomment the toolsets you need";
        path = ./template;
      };

      imports = [
        ./toolsets/default.nix

        ./langs/go.nix
        ./langs/java.nix
        ./langs/lua.nix
        ./langs/nix.nix
        ./langs/nodejs.nix
        ./langs/python.nix
        ./langs/rust.nix
        ./langs/thrift.nix
        ./langs/zig.nix
        ./langs/default.nix

        ./projects/neovim.nix
      ];
    };
}
