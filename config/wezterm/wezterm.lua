local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.font = wezterm.font {
  family = 'JetBrainsMono Nerd Font',
}

return config
