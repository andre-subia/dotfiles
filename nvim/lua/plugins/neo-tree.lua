return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle explorer" },
    { "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Reveal current file" },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = { enabled = true },
      -- netrw is disabled (see config/lazy.lua); opening on a directory arg
      -- is handled explicitly by the VimEnter autocmd in config/autocmds.lua
      hijack_netrw_behavior = "disabled",
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      width = 32,
      mappings = {
        ["<space>"] = "none",
      },
    },
    default_component_configs = {
      indent = { with_expanders = true },
      git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "",
          renamed = "",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
  },
}
