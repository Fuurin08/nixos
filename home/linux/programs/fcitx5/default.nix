{ pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-chinese-addons
      fcitx5-mozc
      fcitx5-configtool
      fcitx5-gtk
    ];
  };
  xdg.configFile = {
    # Theme
    ".local/share/fcitx5/themes/catppuccin-mocha" = {
      source = ./catppuccin-mocha;
      recursive = true;
    };
    # home.file.".local/share/fcitx5/themes/catppuccin-mocha".source = ./catppuccin-mocha.conf;
    "fcitx5/profile" = {
      source = ./profile;
      force = true; # #无论文件是否存在，都强制替换。
    };
    "fcitx5/conf/classicui.conf".source = ./classicui.conf;
  };
}

