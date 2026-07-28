return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = true, style = "compact" },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = table.concat({
          "  ██████╗ ███████╗██╗   ██╗██╗███╗   ███╗",
          "  ██╔══██╗██╔════╝██║   ██║██║████╗ ████║",
          "  ██║  ██║█████╗  ██║   ██║██║██╔████╔██║",
          "  ██║  ██║██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║",
          "  ██████╔╝███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "  ╚═════╝ ╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }, "\n"),
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "recent_files", limit = 8, gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
  keys = {
    { "<leader>un", function() require("snacks").notifier.hide() end, desc = "Dismiss notifications" },
  },
}
