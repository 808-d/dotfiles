{ config, lib, pkgs, ... }:
{
  imports = [
    # ./dotfiles/alacritty.nix
    # ./dotfiles/foot.nix
    # ./dotfiles/ghostty.nix
    # ./dotfiles/kitty.nix
    	# ./dotfiles/noctalia.nix
  ];
	home = {
		packages = with pkgs; [
			hello
		];

# This needs to actually be set to your username
		username = "duc";
		homeDirectory = "/home/duc";

# You do not need to change this if you're reading this in the future.
# Don't ever change this after the first build.  Don't ask questions.
		stateVersion = "26.05";
	};

	programs.btop = {
		enable = true;
		package = pkgs.btop;

		settings = {
			color_theme = "kanagawa-dragon";
			shown_boxes = "cpu mem net proc gpu0";
			shown_gpus = "intel";
		};
	};

	programs.tmux = {
		enable = true;

		plugins = with pkgs; [
			tmuxPlugins.resurrect

			{
				plugin = tmuxPlugins.continuum;
				extraConfig = ''
					set -g @continuum-restore 'on'
					set -g @continuum-save-interval '15'
					'';
			}
		];

		extraConfig = ''
# Pane navigation
			bind h select-pane -L
			bind j select-pane -D
			bind k select-pane -U
			bind l select-pane -R

# Window/tab navigation
			bind-key -n C-Tab next-window
			bind-key -n C-S-Tab previous-window

			set -g @resurrect-processes 'nvim:vim:fish:bash'
			set -g base-index 1
			set -g pane-base-index 1
			set -g allow-passthrough on
			set -ga update-environment TERM
			set -ga update-environment TERM_PROGRAM

			set -g default-terminal "tmux-256color"
			'';

	};
}
