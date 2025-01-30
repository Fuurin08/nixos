{
  inputs,
  ...
}:

{
  imports = [
    inputs.preservation.nixosModules.preservation
  ];

  preservation = {
    enable = true;

    preserveAt."/persist" = {
      directories = [
        "/var/lib"
        "/var/log"

        "/etc/v2raya"

        # secure boot
        "/var/lib/sbctl"
      ];
      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
      ];

      # preserve user-specific files, implies ownership
      users = {
        fuurin = {
          directories = [
            "Documents"
            "Downloads"
            "Music"
            "Pictures"
            "Videos"
            {
              directory = ".ssh";
              mode = "0700";
            }
            {
              directory = ".gnupg";
              mode = "0700";
            }

            ".local/state/nix"
            ".local/state"
            ".local/share"
            #".local"

            ".config"
            ".config/nushell/history.txt"

            ".cache"

            ".cargo"

            # nixos-config file
            "nixos"
            "nixos-config"

            # browsers
            ".mozilla"

            # editor
            ".emacs.d"

            # atuin
            ".config/atuin"
            ".local/share/atuin"

            # steam
            ".local/share/Steam"
            ".steam"
          ];
          files = [
            ".bash_history"
          ];
        };
        root = {
          # specify user home when it is not `/home/${user}`
          home = "/root";
          directories = [
            {
              directory = ".ssh";
              mode = "0700";
            }
          ];
        };
      };
    };
  };

  # systemd-machine-id-commit.service would fail, but it is not relevant
  # in this specific setup for a persistent machine-id so we disable it
  #
  # see the firstboot example below for an alternative approach
  systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];

  # Create some directories with custom permissions.
  #
  # In this configuration the path `/home/butz/.local` is not an immediate parent
  # of any persisted file, so it would be created with the systemd-tmpfiles default
  # ownership `root:root` and mode `0755`. This would mean that the user `butz`
  # could not create other files or directories inside `/home/butz/.local`.
  #
  # Therefore systemd-tmpfiles is used to prepare such directories with
  # appropriate permissions.
  #
  # Note that immediate parent directories of persisted files can also be
  # configured with ownership and permissions from the `parent` settings if
  # `configureParent = true` is set for the file.
  systemd.tmpfiles.settings.preservation = {
    "/home/fuurin/.config".d = {
      user = "fuurin";
      group = "users";
      mode = "0755";
    };
    "/home/fuurin/.local".d = {
      user = "fuurin";
      group = "users";
      mode = "0755";
    };
    "/home/fuurin/.local/share".d = {
      user = "fuurin";
      group = "users";
      mode = "0755";
    };
    "/home/fuurin/.local/state".d = {
      user = "fuurin";
      group = "users";
      mode = "0755";
    };
  };
}
