-- Replaces ts_ls (see lsp.lua): faster, plus organize-imports/rename-file/
-- add-missing-imports commands and inlay hints out of the box.
return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  opts = {
    settings = {
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionResultTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
}
