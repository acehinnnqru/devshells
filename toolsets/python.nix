{pkgs, ...}: let
  commonPackages = with pkgs; [uv ruff ty];
  commonEnv = {UV_PYTHON_DOWNLOADS = "never";};
in {
  "311" = {
    packages = commonPackages ++ [pkgs.python311];
    env = commonEnv;
  };

  "313" = {
    packages = commonPackages ++ [pkgs.python313];
    env = commonEnv;
  };

  "314" = {
    packages = commonPackages ++ [pkgs.python314];
    env = commonEnv;
  };
}
