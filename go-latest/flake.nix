{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, fenix }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        toolchain = fenix.packages."${system}".stable;
      in
      {
        devShell = with pkgs; mkShell {
          buildInputs = [
            libiconv
            gcc

            # go contains go and gofmt
            go

            golangci-lint
            gopls

          ] ++ lib.optionals stdenv.isDarwin (with darwin;
            with apple_sdk.frameworks; [
              libiconv
              libresolv
              Libsystem
              SystemConfiguration
              Security
              CoreFoundation
            ]);
        };
      }
    );
}
