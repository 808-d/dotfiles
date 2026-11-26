{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dunst
    swaylock
waybar
rofi
kanshi
thunar
imv
awww
  ];
}
