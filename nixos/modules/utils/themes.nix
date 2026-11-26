{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lxappearance
	nwg-look
    adwaita-icon-theme
    gtk3
    gtk4
  ];
}
