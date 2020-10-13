{ config, pkgs, ... }:
{
  # Unstable
  # fonts.fonts = with pkgs; [
  #   (nerdfonts.override {
  #     fonts = [ "JetBrainsMono" ];
  #   })
  # ];

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    curl
    wget 
    htop
    telnet
    vim
    tmux
    entr
    ncdu
    terminus_font

    usbutils   # lsusb
    pciutils   # lspci

    # Dev
    git
    gcc
    gnumake
    docker
    docker-compose
    silver-searcher

    (python37.withPackages(ps: with ps; [
      pip
      setuptools
      virtualenv
    ]))
  ];
}
