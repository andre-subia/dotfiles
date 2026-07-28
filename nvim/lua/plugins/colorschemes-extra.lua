-- Extra colorschemes, installed and ready to switch to (catppuccin in
-- colorscheme.lua stays the default). Loaded at startup like catppuccin so
-- they always show up in the picker below and in `:colorscheme` completion.
return {
  { "folke/tokyonight.nvim", lazy = false, opts = { transparent = true } },
  { "ellisonleao/gruvbox.nvim", lazy = false, opts = { transparent_mode = true } },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, opts = { styles = { transparency = true } } },
  { "rebelot/kanagawa.nvim", lazy = false, opts = { transparent = true } },
}
