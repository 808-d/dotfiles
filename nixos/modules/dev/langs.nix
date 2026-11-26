{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    	go
	go-tools
	gcc
	man-pages
	rustup
	nodejs_26
	python314
	python314Packages.pip
	sqlc
	pnpm
	typescript
  ];
}
