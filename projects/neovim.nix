{...}: {
  perSystem = {
    pkgs,
    toolsets,
    ...
  }: let
    inherit (toolsets.lib) combine mkShellArgs;
  in {
    devShells.neovim = pkgs.mkShell (mkShellArgs (combine [
      toolsets.base
      {
        packages = with pkgs; [
          tree-sitter
          gcc
          cmake
          ninja
          clang-tools
          lua
          luajit
          stylua
          lua-language-server
        ];
      }
    ]));
  };
}
