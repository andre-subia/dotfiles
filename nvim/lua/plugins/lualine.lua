return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      -- follows whatever colorscheme is active (kanagawa by default), so
      -- switching with <leader>uc restyles the statusline too
      theme = "auto",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "diagnostics", "encoding", "filetype" },
    },
  },
}
