{ config, pkgs, expr, ... }:
{
  fonts.fonts = with pkgs; [
    # Unstable
    # (nerdfonts.override {
    #   fonts = [ "JetBrainsMono" ];
    # })
    jetbrains-mono
    terminus_font
  ];

  programs.adb.enable = true;
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa -b --git --icons --group-directories-first";
      l = "ls -lah";
    };

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh.enable = true;
    ohMyZsh.theme = "spaceship";
    ohMyZsh.plugins = [
        "ansible"
        "battery"
        # "fzf"
        "pyenv"
        "git"
        "colored-man-pages"
    ];
    ohMyZsh.customPkgs = with pkgs; [
      spaceship-prompt
      zsh-history-substring-search
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
    lnav
    file

    unrar
    zip unzip
    p7zip

    gnome3.gnome-tweaks

    usbutils   # lsusb
    pciutils   # lspci

    # Dev
    git
    gcc
    gnumake
    docker
    docker-compose
    silver-searcher
    libmysqlclient

    (python37.withPackages(ps: with ps; [
      pip
      setuptools
      virtualenv
    ]))
  ];
}
