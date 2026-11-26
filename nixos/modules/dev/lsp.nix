{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    clang-tools
    zuban
    vtsls
	lua-language-server
	nixd
  ];
}
