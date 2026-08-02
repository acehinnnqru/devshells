{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells.lua = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.lua.default]));
  };
}
