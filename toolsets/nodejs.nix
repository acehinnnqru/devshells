{pkgs, ...}: let
  commonPackages = with pkgs; [
    libiconv
    gcc
    yarn
    typescript-language-server
    vscode-langservers-extracted
    prettierd
  ];
in {
  "22" = {
    packages = commonPackages ++ [pkgs.nodejs_22 pkgs.pnpm];
  };
}
