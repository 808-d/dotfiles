{ ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "kanagawa_dragon";
    settings = {
      window = {
        decorations = "Full";
        decorations_theme_variant = "Dark";
        # opacity = 0.75;
      };

      font = {
        size = 16.0;
        normal.family = "JetBrains Mono Nerd Font";
        bold.family = "JetBrains Mono Nerd Font";
        italic.family = "JetBrains Mono Nerd Font";
        bold_italic.family = "JetBrains Mono Nerd Font";
      };
    };
  };
}
