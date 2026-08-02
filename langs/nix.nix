{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) mkShellArgs;
  in {
    devShells.nix = pkgs.mkShell (mkShellArgs toolsets.base);
  };
}
