{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells.thrift = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.thrift.default]));
  };
}
