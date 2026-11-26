{ config, pkgs, inputs, ... }:

{
    imports = [
	./hardware-configuration.nix
	    ./modules/dev/lsp.nix
	    ./modules/dev/lint.nix
	    ./modules/desktops/plasma.nix
./modules/desktops/wm-pkgs.nix
	    ./modules/dev/langs.nix
	    ./modules/dev/devops.nix
	    ./modules/dev/tools.nix
	    ./modules/utils/themes.nix
    ];
  nix.settings = {
    substituters = [
      "https://cache.lantian.pub/lantian"
    ];

    trusted-public-keys = [
      "lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ="
    ];
  };
    nixpkgs.config.allowUnfree = true;
# Bootloader
    boot.loader = {
	systemd-boot.enable = false;
	efi.canTouchEfiVariables = true;

	timeout = 5;

	grub = {
	    enable = true;
	    efiSupport = true;
	    device = "nodev";

	    useOSProber = true;

	    theme = pkgs.minimal-grub-theme;
	};
    };

# Networking
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

# Time zone
    time.timeZone = "Asia/Ho_Chi_Minh";

# Locale
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
	LC_ADDRESS = "vi_VN";
	LC_IDENTIFICATION = "vi_VN";
	LC_MEASUREMENT = "vi_VN";
	LC_MONETARY = "vi_VN";
	LC_NAME = "vi_VN";
	LC_NUMERIC = "vi_VN";
	LC_PAPER = "vi_VN";
	LC_TELEPHONE = "vi_VN";
	LC_TIME = "vi_VN";
    };

# X11 keyboard
    services.xserver.xkb = {
	layout = "us";
	variant = "";
    };

# User
    users.users.duc = {
	isNormalUser = true;
	description = "duc";
	extraGroups = [ "networkmanager" "wheel" "docker"];
	shell = pkgs.fish;
    };


# System packages
    environment.systemPackages = with pkgs; [
	firefox
	    wget
	    git
	    eza
	    obsidian
	    fastfetch
	    fzf
	    zoxide
	    steam
	    starship
	    wl-clipboard
	    wl-clip-persist
	    slurp
	    cliphist

	    unzip
	    anki
	    mpv
	    discord
	    kubectl

	    tmux
	    ripgrep
	    pavucontrol
	    proton-vpn

	    qt6.qtbase
	    qt6.qtmultimedia
	    docker-compose

	    gammastep
	    redshift
	    maim
	    grim
	    wlr-randr
	    zathura
	    mousepad
	    brightnessctl
	    tlp
	    wine64
	    ];


# Programs
    programs.fish.enable = true;
    programs.starship.enable = true;

    programs.steam.package = pkgs.steam;
    programs.steam.enable = true;

    programs.nix-ld.enable = true;

    services.displayManager.ly.enable = true;
    services.flatpak.enable = true;

    programs.appimage = {
	enable = true;
	binfmt = true;
    };
# PipeWire
    services.pipewire = {
	enable = true;
	pulse.enable = true;
    };
# Set limit laptop battery
# Power management
    services = {
	tlp = {
	    enable = true;

	    settings = {
		START_CHARGE_THRESH_BAT0 = 70;
		STOP_CHARGE_THRESH_BAT0 = 80;
	    };
	};

	power-profiles-daemon.enable = false;
    };

# Anki sync server
    services.anki-sync-server = {
	enable = true;
	address = "127.0.0.1";

	users = [
	{
	    username = "duc";
	    password = "123";
	}
	];
    };

    services.envfs.enable = true;
    services.openssh.enable = true;
# virtualisation
    virtualisation = {
	docker.enable = true;
    };
    virtualisation.docker.package = pkgs.docker;
# Fonts
    fonts = {
	packages = with pkgs; [
	    nerd-fonts.jetbrains-mono
	];

	fontconfig = {
	    enable = true;
	    defaultFonts = {
		serif = [ "DejaVu Serif" ];
		monospace = [ "DejaVu Sans" ];
	    };
	};
    };

# Garbage collection
    nix.gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 7d";
    };

    nix.settings.auto-optimise-store = true;

# Fcitx5
    i18n.inputMethod = {
	enable = true;
	type = "fcitx5";

	fcitx5.addons = with pkgs; [
	    fcitx5-mozc
		fcitx5-bamboo
		fcitx5-gtk
	];
    };

    nix.settings.experimental-features = [
	"nix-command"
	    "flakes"
    ];

    system.stateVersion = "26.05";
}
