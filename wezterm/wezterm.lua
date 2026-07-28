local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- catppuccin ships as a built-in color scheme, no plugin needed
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13
config.line_height = 1.1

-- real background transparency + macOS blur (matches nvim's transparent editor)
config.window_background_opacity = 0.88
config.macos_window_background_blur = 20

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

config.default_cursor_style = "SteadyBlock"
config.scrollback_lines = 10000

return config
