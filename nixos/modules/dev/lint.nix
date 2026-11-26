
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Go
    golangci-lint

    # JavaScript / TypeScript
    eslint
    prettier
    typescript

    # C
    clang-tools

    # Python
    ruff
  ];
}
