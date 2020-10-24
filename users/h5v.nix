{ config, pkgs, expr, ... }:
{
  imports = [
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager.users.h5v = {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi.override { 
        plugins = [ pkgs.rofi-emoji ]; 
      };
    };

    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ 
        nerdtree
        solarized
        vim-airline 
        vim-nix
        gitgutter
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
    extraGroups = [ "wheel" "docker" "adbusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      # Browsers
      firefox chromium surf

      # Image viewers / editors
      sxiv
      zathura
      libreoffice-fresh

      # Image editing
      inkscape

      # Players
      mpv cmus mps-youtube rhythmbox

      # Downloaders
      qbittorrent

      # Messaging
      slack
      mcabber expr.mcabber-editor
      tdesktop   # Telegram
      konversation
      thunderbird
      zoom-us
      
      # Utils / No GUI
      xclip       # manipulate X clipboard
      exa         # ls replacement
      taskwarrior # task tracker
      playerctl   # Control players via MPRIS
      tig         # git CUI
      tmux        # terminal multiplexer
      github-cli
      ncdu        # analyze disk space
      neofetch
      nixfmt      # nix formatter
      translate-shell

      # Utils / GUI
      zeal        # Documentation browser
      flameshot   # screenshots
      keepassxc   # password manager
      ptask       # taskwarrior GUI

      # File managers
      ranger

      # Terminals
      kitty tilda 
      
      # Dev
      jetbrains.pycharm-professional

      # Applets / WM tools
      xxkb
      gnome3.networkmanagerapplet
      mate.mate-polkit
      picom
      xss-lock
      i3lock-fancy
      xorg.xmodmap

      # Appearance
      papirus-icon-theme
    ];
  };
}
