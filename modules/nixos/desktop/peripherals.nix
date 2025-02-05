{
  ...
}:

{
  #============== Audio =============#
  # Enable sound.
  # hardware.pulseaudio.enable = true;

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    wireplumber.enable = true;
  };

  #============== bluetooth =========#

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  #============== others ============#

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
