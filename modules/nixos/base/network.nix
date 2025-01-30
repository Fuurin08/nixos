{
  ...
}:

{
  networking = {
    useDHCP = false;
    useNetworkd = true;
    wireless.iwd = {
      enable = true;
      settings = {
        Network = {
          EnableIPv6 = true;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
  };

  # https://man.archlinux.org/man/systemd.network.5
  systemd.network.networks = {
    "10-eth0" = {
      #matchConfig.Name = [
      #  "en*"
      #  "eth*"
      #];
      matchConfig = {
        kind = "!*";
        Type = "ether";
      };
      DHCP = "yes";
      dhcpV4Config.RouteMetric = 128;
      dhcpV6Config.RouteMetric = 128;
    };
    "11-wlan0" = {
      name = "wlan0";
      DHCP = "yes";
      dhcpV4Config.RouteMetric = 2048;
      dhcpV6Config.RouteMetric = 2048;
    };
  };
}
