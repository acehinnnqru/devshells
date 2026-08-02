{
  pkgs,
  system,
  inputs,
  ...
}: let
  pkgsGo124 = import inputs.nixpkgs-go124 {inherit system;};
  pkgsGo125 = import inputs.nixpkgs-go125 {inherit system;};

  commonPackages = with pkgs; [
    libiconv
    gcc
    golangci-lint
    gotools
    gomodifytags
  ];
in {
  latest = {
    packages = commonPackages ++ (with pkgs; [go gopls delve]);
  };

  "1_25" = {
    packages = commonPackages ++ (with pkgsGo125; [go_1_25 gopls delve]);
  };

  "1_24" = {
    packages = commonPackages ++ (with pkgsGo124; [go_1_24 gopls delve]);
  };
}
