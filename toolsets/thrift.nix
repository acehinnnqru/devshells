{pkgs, ...}: {
  default = {
    packages = with pkgs; [
      thrift-ls
    ];
  };
}
