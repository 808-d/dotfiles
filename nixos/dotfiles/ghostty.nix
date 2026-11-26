{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Kanagawa Dragon";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 16;

      confirm-close-surface = false;
      shell-integration = "fish";
      alpha-blending = "native";
      bold-is-bright = false;
    };
  };
}

