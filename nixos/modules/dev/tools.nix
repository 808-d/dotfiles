{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    	ghidra
	neovim
	dbeaver-bin
	opencode
	bruno
	gnumake
  ];
}
