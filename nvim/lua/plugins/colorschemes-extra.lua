-- Extra colorschemes, installed and ready to switch to (kanagawa in
-- colorscheme.lua stays the default). Loaded at startup like kanagawa so
-- they always show up in the picker (<leader>uc) and in `:colorscheme`
-- completion.
return {
  { "catppuccin/nvim", name = "catppuccin", lazy = false, opts = { flavour = "mocha", transparent_background = true } },
  { "folke/tokyonight.nvim", lazy = false, opts = { transparent = true } },
  { "ellisonleao/gruvbox.nvim", lazy = false, opts = { transparent_mode = true } },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, opts = { styles = { transparency = true } } },
}
