{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells = {
      "rust-stable" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.rust.stable]));
      "rust-nightly" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.rust.nightly]));
      "rust-nightly-wasm" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.rust.nightly-wasm]));
    };
  };
}
