{
  pkgs,
  ...
}:

{
  imports = [
    #./ags.nix
    ./services
  ];

  home.packages = with pkgs; [
    niri # windows manager
    swaybg
  ];

  xdg.configFile = {
    "niri/config.kdl" = {
      source = ./niri.kdl;
    };
  };
}