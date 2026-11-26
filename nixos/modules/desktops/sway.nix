{ config, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    i3status
  ];
}
