{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "exa -b --git --icons --group-directories-first";
      l = "ls -lah";
    };
    ohMyZsh.enable = true;
    interactiveShellInit = ''
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      export ZSH_THEME="lambda"
      plugins=(
        ansible
        battery
        fzf
        git
        zsh-autosuggestions
      )
      source $ZSH/oh-my-zsh.sh
    '';
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.h5v = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      # Browsers / Viewers
      firefox
      chromium
      surf
      zeal
      sxiv
      zathura
      mpv

      # Downloaders
      qbittorrent

      # Messaging
      slack
      mcabber
      tdesktop   # Telegram
      thunderbird
      
      # Utils
      flameshot  # screenshots
      rofi       # launcher
      keepassxc
      exa        # ls replacement
      quota      # KDE disk quota widget dependency
      zsh-autosuggestions

      # File managers
      ranger

      # Terminals
      kitty
      tilda
      tmux
      
      # Dev
      jetbrains.pycharm-professional
      python27Packages.virtualenv

      # Applets / WM tools
      xxkb
      gnome3.networkmanagerapplet
      mate.mate-polkit
      picom
      xss-lock
      i3lock-fancy

      # Appearance
      papirus-icon-theme
    ];
  };
}
