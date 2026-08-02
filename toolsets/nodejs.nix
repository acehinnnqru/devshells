{pkgs, ...}: let
  commonPackages = with pkgs; [
    libiconv
    gcc
    pnpm
    typescript-language-server
    vscode-langservers-extracted
    oxlint
    oxfmt
  ];
in {
  "22" = {
    packages =
      commonPackages
      ++ [
        pkgs.nodejs_22
      ];
  };
}
