{
  inputs,
  pkgs,
  ...
}:

{
  imports = [ inputs.niri.homeModules.niri ];

  programs.niri = {
    enable = true;
  };

}