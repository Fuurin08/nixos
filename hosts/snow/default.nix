{
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./disko.nix
    ./secureboot.nix
    ./preservation.nix
    #./impermanence.nix

    ../../modules/hardware/amdgpu.nix

    ../../modules/common

    ../../modules/nixos/base
    #../../modules/nixos/game
    ../../modules/nixos/desktop
  ];

  networking.hostName = "snow"; # Define your hostname.

  # System Version
  system.stateVersion = "24.11"; # Did you read the comment?
}
