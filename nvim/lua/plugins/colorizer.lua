return {
  "catgoose/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    filetypes = { "*" },
    user_default_options = {
      names = false, -- don't highlight color words like "red" (noisy in prose/markdown)
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      css = true,
      css_fn = true,
      mode = "background",
    },
  },
}
