{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells = {
      "go-latest" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.go.latest]));
      "go-1_25" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.go."1_25"]));
      "go-1_24" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.go."1_24"]));
    };
  };
}
