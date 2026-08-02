{pkgs, ...}: {
  default = {
    packages = with pkgs; [
      lua
      stylua
      lua-language-server
    ];
  };
}
