{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells = {
      zig = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.zig.default]));
      "zig-latest" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.zig.latest]));
    };
  };
}
