{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells = {
      "python-311" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.python."311"]));
      "python-313" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.python."313"]));
      "python-314" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.python."314"]));
    };
  };
}
