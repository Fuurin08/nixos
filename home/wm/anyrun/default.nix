{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        shell
        rink
        translate
        dictionary
        websearch
      ];
      width.fraction = 0.3;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
    };
    # extraCss = ''
    #   @define-color bg-col  rgba(30, 30, 46, 0.7);
    #   @define-color bg-col-light rgba(150, 220, 235, 0.7);
    #   @define-color border-col rgba(30, 30, 46, 0.7);
    #   @define-color selected-col rgba(150, 205, 251, 0.7);
    #   @define-color fg-col #D9E0EE;
    #   @define-color fg-col2 #F28FAD;

    #   * {
    #     transition: 200ms ease;
    #     font-family: "JetBrainsMono Nerd Font";
    #     font-size: 1.3rem;
    #   }

    #   #window {
    #     background: transparent;
    #   }

    #   #plugin,
    #   #main {
    #     border: 3px solid @border-col;
    #     color: @fg-col;
    #     background-color: transparent;
    #   }
    #   /* anyrun's input window - Text */
    #   #entry {
    #     color: @fg-col;
    #     background-color: @bg-col;
    #   }

    #   /* anyrun's ouput matches entries - Base */
    #   #match {
    #     color: @fg-col;
    #     background: @bg-col;
    #   }

    #   /* anyrun's selected entry - Red */
    #   #match:selected {
    #     color: @fg-col2;
    #     background: @selected-col;
    #   }

    #   #match {
    #     padding: 3px;
    #     border-radius: 16px;
    #   }

    #   #entry, #plugin:hover {
    #     border-radius: 16px;
    #   }

    #   box#main {
    #     background: rgba(30, 30, 46, 0.7);
    #     border: 1px solid @border-col;
    #     border-radius: 15px;
    #     padding: 5px;
    #   }
    # '';
    extraCss = ''
      * {
        all: unset;
        font-size: 1.3rem;
      }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #match.activatable {
        border-radius: 16px;
        padding: 0.3rem 0.9rem;
        margin-top: 0.01rem;
      }
      #match.activatable:first-child {
        margin-top: 0.7rem;
      }
      #match.activatable:last-child {
        margin-bottom: 0.6rem;
      }

      #plugin:hover #match.activatable {
        border-radius: 10px;
        padding: 0.3rem;
        margin-top: 0.01rem;
        margin-bottom: 0;
      }

      #match:selected,
      #match:hover,
      #plugin:hover {
        background: rgba(255, 255, 255, 0.1);
      }

      #entry {
        background: rgba(255, 255, 255, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 16px;
        margin: 0.5rem;
        padding: 0.3rem 1rem;
      }

      list > #plugin {
        border-radius: 16px;
        margin: 0 0.3rem;
      }
      list > #plugin:first-child {
        margin-top: 0.3rem;
      }
      list > #plugin:last-child {
        margin-bottom: 0.3rem;
      }
      list > #plugin:hover {
        padding: 0.6rem;
      }

      box#main {
        background: rgba(0, 0, 0, 0.5);
      box-shadow:
        inset 0 0 0 1px rgba(255, 255, 255, 0.1),
        0 0 0 1px rgba(0, 0, 0, 0.5);
      border-radius: 24px;
      padding: 0.3rem;
      }
    '';
  };
}