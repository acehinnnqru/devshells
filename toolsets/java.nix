{pkgs, ...}: {
  android = {
    packages = with pkgs; [
      jdk17
      maven
      gradle
      ktfmt
    ];
  };
}
