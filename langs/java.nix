{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells."java-android" = pkgs.mkShell (mkShellArgs (combine [toolsets.base toolsets.java.android]));
  };
}
