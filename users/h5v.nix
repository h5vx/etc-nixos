{ config, pkgs, expr, ... }:
{
  imports = [
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager.users.h5v = {
    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ 
        nerdtree
        solarized
        vim-airline 
        vim-nix
        LanguageClient-neovim
      ];
      settings = { ignorecase = true; };
      extraConfig = ''
        set tabstop=2
        set shiftwidth=2
        set expandtab
        let g:LanguageClient_serverCommands = {
          \ 'python': ['pyls']
          \ }
         nnoremap <F5> :call LanguageClient_contextMenu()<CR>
         nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
         nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
         nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
         nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
         nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
         nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<CR>
      '';
    };
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
      libreoffice-fresh

      # Image editing
      inkscape

      # Players
      mpv
      cmus
      mps-youtube

      # Downloaders
      qbittorrent

      # Messaging
      slack
      mcabber expr.mcabber-editor
      tdesktop   # Telegram
      thunderbird
      zoom-us
      
      # Utils
      flameshot  # screenshots
      rofi       # launcher
      keepassxc
      exa        # ls replacement
      taskwarrior ptask
      playerctl

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
