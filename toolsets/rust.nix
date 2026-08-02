{
  pkgs,
  system,
  inputs,
  ...
}: let
  pkgsWithFenix = import inputs.nixpkgs {
    inherit system;
    overlays = [inputs.fenix.overlays.default];
  };

  wasmToolchain = with inputs.fenix.packages.${system};
    combine [
      complete.toolchain
      targets.wasm32-unknown-unknown.latest.rust-std
    ];

  commonPackages = with pkgsWithFenix; [
    taplo
    gcc
    lldb
    pkg-config
    libiconv
    cargo-nextest
  ];

  commonShellHook = ''
    echo initing rust env
    rustc --version
    cargo --version
    export PATH=$PATH:~/.cargo/bin
    echo loaded rust env
  '';

  commonEnv = {
    RUST_BACKTRACE = 1;
  };
in {
  stable = {
    packages = commonPackages ++ [pkgsWithFenix.rust-analyzer];
    nativeBuildInputs = [inputs.fenix.packages.${system}.stable.toolchain];
    env = commonEnv;
    shellHook = commonShellHook;
  };

  nightly = {
    packages = commonPackages ++ [pkgsWithFenix.gdb];
    nativeBuildInputs = [inputs.fenix.packages.${system}.complete.toolchain];
    env = commonEnv;
    shellHook = commonShellHook;
  };

  nightly-wasm = {
    packages = commonPackages ++ [pkgsWithFenix.rust-analyzer-nightly];
    nativeBuildInputs = [wasmToolchain];
    env = commonEnv;
    shellHook = commonShellHook;
  };
}
