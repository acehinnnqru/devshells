{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells = {
      "nodejs-22" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.nodejs."22"]));
    };
  };
}
