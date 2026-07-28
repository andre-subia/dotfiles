-- VS Code-style minimap on the right edge, with search/diagnostics/git
-- changes marked on it.
return {
  "nvim-mini/mini.map",
  event = "VeryLazy",
  keys = {
    { "<leader>um", function() require("mini.map").toggle() end, desc = "Toggle minimap" },
  },
  config = function()
    local map = require("mini.map")
    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diagnostic(),
        map.gen_integration.gitsigns(),
      },
      symbols = { encode = map.gen_encode_symbols.dot("4x2") },
      window = { side = "right", width = 12, show_integration_count = false },
    })
  end,
}
