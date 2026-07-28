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

-- integrate the traffic-light buttons into the (themed) tab bar instead of a
-- separate native title bar, so the whole top strip is one color like Hyper
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "MacOsNative"
config.integrated_title_button_alignment = "Left"
config.integrated_title_button_color = "Auto"

-- Known upstream bug when maximized/fullscreen: window pixel height isn't an
-- exact multiple of the cell grid, leaving a thin gap at the bottom (visible
-- right under lualine). No clean fix on the stable release; the fix
-- (`window_content_alignment`, to move the gap to the top instead) only
-- exists on WezTerm nightly builds. See:
-- https://github.com/wezterm/wezterm/issues/6256
-- https://github.com/wezterm/wezterm/issues/7113
-- Living with it for now rather than switching to nightly.

config.default_cursor_style = "SteadyBlock"
config.scrollback_lines = 10000

return config
