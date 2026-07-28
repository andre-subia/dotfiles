return {
  "vuki656/package-info.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  ft = "json",
  opts = {},
  keys = {
    { "<leader>ns", "<cmd>PackageInfoShow<cr>", desc = "Show package versions" },
    { "<leader>nc", "<cmd>PackageInfoHide<cr>", desc = "Hide package versions" },
    { "<leader>nt", "<cmd>PackageInfoToggle<cr>", desc = "Toggle package versions" },
    { "<leader>nu", "<cmd>PackageInfoUpdate<cr>", desc = "Update package under cursor" },
    { "<leader>nd", "<cmd>PackageInfoDelete<cr>", desc = "Delete package under cursor" },
    { "<leader>ni", "<cmd>PackageInfoInstall<cr>", desc = "Install a new package" },
    { "<leader>np", "<cmd>PackageInfoChangeVersion<cr>", desc = "Change package version" },
  },
}
