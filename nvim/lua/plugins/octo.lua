-- GitHub PRs/issues/discussions inside Neovim. Uses the `gh` CLI, already
-- installed and authenticated (see README).
return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    picker = "telescope",
    enable_builtin = true,
  },
  keys = {
    { "<leader>oi", "<cmd>Octo issue list<cr>", desc = "List GitHub issues" },
    { "<leader>op", "<cmd>Octo pr list<cr>", desc = "List GitHub pull requests" },
    { "<leader>on", "<cmd>Octo notification list<cr>", desc = "List GitHub notifications" },
    {
      "<leader>os",
      function()
        require("octo.utils").create_base_search_command({ include_current_repo = true })
      end,
      desc = "Search GitHub",
    },
  },
}
