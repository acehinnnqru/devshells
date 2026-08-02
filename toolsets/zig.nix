{
  pkgs,
  system,
  inputs,
  ...
}: {
  default = {
    packages = with pkgs; [zls zig];
  };

  latest = {
    packages = with pkgs; [zls] ++ [inputs.zig-overlay.packages.${system}.master];
  };
}
