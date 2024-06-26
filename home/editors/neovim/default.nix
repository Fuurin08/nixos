{
  config,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    neovide
  ];
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;  # 使用 neovim-unwrapped
    defaultEditor = true;

    viAlias = true;  # 使得 `vi` 命令指向 `nvim`
    vimAlias = true; # 使得 `vim` 命令指向 `nvim`

    plugins = with pkgs.vimPlugins; [
      # lazy-nvim
    ];
  };

  home.file."${config.xdg.configHome}/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}