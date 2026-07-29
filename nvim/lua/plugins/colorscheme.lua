return {
  "rebelot/kanagawa.nvim",
  lazy = false, -- load at startup, not on-demand (config sets `defaults.lazy = true`)
  priority = 1000, -- load before other plugins
  opts = {
    theme = "wave", -- wave (dark), dragon (darker/muted), lotus (light)
    background = { dark = "wave", light = "lotus" },
    transparent = true,
    terminalColors = true,
    dimInactive = false,
    commentStyle = { italic = true },
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    overrides = function(colors)
      local theme = colors.theme
      return {
        -- keep floats transparent too, matching the editor background
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
        -- plugin popups that read better with a real (dark) background
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        TelescopeTitle = { fg = theme.ui.special, bold = true },
        TelescopeBorder = { fg = theme.ui.float.fg_border, bg = "none" },
        -- crosshair cursor (see config/options.lua): visible over transparency
        CursorLine = { bg = theme.ui.bg_p2 },
        CursorColumn = { bg = theme.ui.bg_p2 },
      }
    end,
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme("kanagawa")
  end,
}
