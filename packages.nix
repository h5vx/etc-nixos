{ config, pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    # Unstable
    # (nerdfonts.override {
    #   fonts = [ "JetBrainsMono" ];
    # })
    # www.ephifonts.com doesn't respond
    # helvetica-neue-lt-std
  ];
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa -b --git --icons --group-directories-first";
      l = "ls -lah";
    };
    ohMyZsh.enable = true;
    ohMyZsh.theme = "refined";
    ohMyZsh.plugins = [
        "ansible"
        "battery"
        # "fzf"
        "git"
        "zsh-autosuggestions"
    ];
    ohMyZsh.customPkgs = [
      pkgs.zsh-autosuggestions
      pkgs.nix-zsh-completions
    ];
  };

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
