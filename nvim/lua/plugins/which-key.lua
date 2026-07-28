return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
  },
  spec = {
    { "<leader>f", group = "Find" },
    { "<leader>e", group = "Explorer" },
    { "<leader>h", group = "Git hunk" },
    { "<leader>c", group = "Code" },
    { "<leader>b", group = "Buffer" },
    { "<leader>a", group = "AI/Claude" },
    { "<leader>u", group = "UI" },
  },
}
