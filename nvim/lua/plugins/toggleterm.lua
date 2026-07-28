-- General-purpose terminal for Metro/Expo dev server, git, etc. Kept
-- separate from claudecode.nvim on purpose: running `claude` manually in a
-- plain terminal here would lose the IDE integration (selection sync,
-- diagnostics, native diffs) that `<leader>ac` already gives you.
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { [[<c-\>]], "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal", mode = { "n", "t" } },
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
  },
  opts = {
    open_mapping = [[<c-\>]],
    direction = "float",
    float_opts = { border = "curved" },
    size = 15,
    start_in_insert = true,
  },
}
