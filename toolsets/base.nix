{pkgs, ...}: {
  packages = with pkgs; [
    tree-sitter
    yaml-language-server
    marksman
    vscode-langservers-extracted
    alejandra
    nil
    just
  ];
}
