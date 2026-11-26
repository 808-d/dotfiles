{ config, pkgs, ... }:

{
	programs.kitty = {
		enable = true;
		package = pkgs.kitty;
		font = {
			name = "JetBrainsMono Nerd Font";
			size = 16;
		};
		settings = {
			tab_bar_edge = "top";
			tab_bar_style = "powerline";
			# active_tab_background = "#8a9a7b";
			close_window_with_confirmation = "ignore-shell";
		};

		themeFile = "kanagawa_dragon";
	};
}

